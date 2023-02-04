USE accounting;


CREATE VIEW IF NOT EXISTS qcw1 AS
SELECT
  SUM(debit) AS totalDR,
  SUM(credit) AS totalCR,
  SUM(debit) - SUM(credit) AS totalOH
FROM customWork
;


CREATE VIEW IF NOT EXISTS qproto1 AS
SELECT
  SUM(debit) AS totalDR,
  SUM(credit) AS totalCR,
  SUM(debit) - SUM(credit) AS totalOH
FROM prototypes
;


CREATE VIEW IF NOT EXISTS qrm1 AS
SELECT
  rawMaterials.snid,
  SUM(rmIn.debit) AS debit,
  SUM(rmIn.pcsIn) AS pcsIn,
  ROUND(SUM(rmIn.debit) / SUM(rmIn.pcsIn), 2) AS costPerPc,
  ROUND(rawMaterials.inchesPerPc / rawMaterials.inchesPerUnit, 0) AS unitsPerPc,
  ROUND((rawMaterials.inchesPerPc / rawMaterials.inchesPerUnit) * SUM(rmIn.pcsIn), 0) AS unitsIn,
  ROUND((rawMaterials.inchesPerPc / rawMaterials.inchesPerUnit) * rawMaterials.pcsPerCs, 0) AS unitsPerCs,
  ROUND(SUM(rmIn.debit) / ((rawMaterials.inchesPerPc / rawMaterials.inchesPerUnit) * SUM(rmIn.pcsIn)), 2) AS costPerUnit
FROM rawMaterials, rmIn
WHERE rawMaterials.snid = rmIn.snid
GROUP BY rawMaterials.snid
;


CREATE VIEW IF NOT EXISTS qrm2 AS
SELECT
  rawMaterials.snid,
  SUM(rmOut.units) AS units,
  SUM(rmOut.waste) AS waste,
  SUM(rmOut.rnd) AS rnd,
  SUM(rmOut.units) + SUM(rmOut.waste) + SUM(rmOut.rnd) AS unitsOut
FROM rawMaterials, rmOut
WHERE rawMaterials.snid = rmOut.snid
GROUP BY rawMaterials.snid
;

CREATE VIEW IF NOT EXISTS vRawMaterials AS
SELECT
  CONCAT(rawMaterials.snid, " ", rawMaterials.category, " ", rawMaterials.make, " ", rawMaterials.model) AS description,
  rawMaterials.diameter AS diameter,
  rawMaterials.thickness AS thickness,
  rawMaterials.oz as oz,
  qrm1.debit as debit,
  qrm1.costPerUnit * qrm2.unitsOut AS credit,
  qrm1.costPerUnit * qrm2.units AS uDR,
  qrm1.costPerUnit * qrm2.waste AS wDR,
  qrm1.costPerUnit * qrm2.rnd AS rndDR,
  qrm1.costPerPc AS costPerPc,
  qrm1.costPerUnit AS costPerUnit,
  rawMaterials.inchesPerUnit AS inchesPerUnit,
  rawMaterials.inchesPerPc AS inchesPerPc,
  rawMaterials.pcsPerCs AS pcsPerCs,
  qrm1.unitsPerPc AS unitsPerPc,
  qrm1.unitsPerCs AS unitsPerCs,
  qrm1.pcsIn AS pcsIn,
  qrm1.unitsIn AS unitsIn,
  qrm2.unitsOut AS unitsOut,
  qrm1.unitsIn - qrm2.unitsOut AS unitsOH,
  qrm2.units AS units,
  qrm2.waste AS waste,
  qrm2.rnd AS rnd
FROM rawMaterials, qrm1, qrm2
WHERE rawMaterials.snid = qrm1.snid AND qrm1.snid = qrm2.snid
GROUP BY rawMaterials.snid
;


CREATE VIEW IF NOT EXISTS qpw1 AS
SELECT
  productionWork.snid,
  SUM(pwIn.unitsIn) AS unitsIn,
  SUM(pwIn.unitsIn) * productionWork.wholesale AS debit
FROM productionWork, pwIn
WHERE productionWork.snid = pwIn.snid
GROUP BY productionWork.snid
;

CREATE VIEW IF NOT EXISTS qpw2 AS
SELECT
  productionWork.snid,
  SUM(pwOut.unitsOut) AS unitsOut,
  SUM(pwOut.unitsOut) * productionWork.wholesale AS credit
FROM productionWork, pwOut
WHERE productionWork.snid = pwOut.snid
GROUP BY productionWork.snid
;

CREATE VIEW IF NOT EXISTS vProductionWork AS
SELECT
  CONCAT(productionWork.snid, " ", productionWork.model, " ", productionWork.description) AS description,
  productionWork.msrp AS msrp,
  productionWork.wholesale AS wholesale,
  productionWork.inchesPerUnit AS inchesPerUnit,
  qpw1.unitsIn AS unitsIn,
  qpw2.unitsOut AS unitsOut,
  qpw1.unitsIn - qpw2.unitsOut AS unitsOH,
  qpw1.debit,
  qpw2.credit,
  (qpw1.unitsIn - qpw2.unitsOut) * productionWork.msrp AS retailValue
FROM productionWork, qpw1, qpw2
WHERE productionWork.snid = qpw1.snid AND qpw1.snid = qpw2.snid
GROUP BY productionWork.snid
;


CREATE VIEW IF NOT EXISTS qsi1 AS
SELECT
  storeInventory.snid,
  SUM(siIn.debit) AS debit,
  SUM(siIn.unitsIn) AS unitsIn,
  ROUND(SUM(siIn.debit) / SUM(siIn.unitsIn), 2) AS costPerUnit
FROM storeInventory, siIn
WHERE storeInventory.snid = siIn.snid
GROUP BY storeInventory.snid
;

CREATE VIEW IF NOT EXISTS qsi2 AS
SELECT
  storeInventory.snid,
  SUM(siOut.unitsOut) AS unitsOut
FROM storeInventory, siOut
WHERE storeInventory.snid = siOut.snid
GROUP BY storeInventory.snid
;

CREATE VIEW IF NOT EXISTS vStoreInventory AS
SELECT
  storeInventory.snid,
  storeInventory.description,
  storeInventory.msrp,
  storeInventory.unitsPerCs,
  qsi1.debit,
  ROUND((qsi1.debit / qsi1.unitsIn) * qsi2.unitsOut, 2) AS credit,
  qsi1.unitsIn AS unitsIn,
  qsi2.unitsOut AS unitsOut,
  qsi1.unitsIn - qsi2.unitsOut AS unitsOH,
  ROUND(qsi1.debit / qsi1.unitsIn, 2) AS costPerUnit
FROM storeInventory, qsi1, qsi2
WHERE storeInventory.snid = qsi1.snid AND qsi1.snid = qsi2.snid
GROUP BY storeInventory.snid
;
