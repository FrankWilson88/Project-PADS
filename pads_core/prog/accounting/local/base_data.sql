USE accounting;

ALTER TABLE accountsReceivable AUTO_INCREMENT=12000;
INSERT INTO accountsReceivable(description, valueLoaned, defaultAmount, unitsLoaned, valuePayed) VALUES("Null Description", "0", "0", "0", "0");


ALTER TABLE rawMaterials AUTO_INCREMENT=131000;
INSERT INTO rawMaterials(category, make, model, diameter, thickness, inchesPerUnit, inchesPerPc, pcsPerCs) VALUES("Clear", "Brand Name", "Tube", "0", "0", "0", "0", "0");
INSERT INTO rmIn(snid, category, make, model, debit, pcsIn, invoiceId) VALUES("131000", "Clear", "Brand Name", "Tube", "0", "0", "0");
INSERT INTO rmOut(snid, category, make, model, units, waste, rnd) VALUES("131000", "Clear", "Brand Name", "Tube", "0", "0", "0");


ALTER TABLE productionWork AUTO_INCREMENT=132000;
INSERT INTO productionWork(model, description, msrp, wholesale, inchesPerUnit) VALUES("Name", "Style of piece", "0", "0", "0");
INSERT INTO pwIn(snid, model, unitsIn) VALUES("132000", "Name", "0");
INSERT INTO pwOut(snid, model, unitsOut) VALUES("132000", "Name", "0");


ALTER TABLE customWork AUTO_INCREMENT=133000;
INSERT INTO customWork(model, description, debit, credit) VALUES("Name", "Description", "0", "0");


ALTER TABLE prototypes AUTO_INCREMENT=134000;
INSERT INTO prototypes(model, description, debit, credit) VALUES("Name-101", "Original/Alter to Name-000", "0", "0");


ALTER TABLE storeInventory AUTO_INCREMENT=135000;
INSERT INTO storeInventory(description, msrp, unitsPerCs) VALUES("Item Name", "0", "0");
INSERT INTO siIn(snid, description) VALUES("135000", "Company, Name, Item No.");
INSERT INTO siOut(snid, description) VALUES("135000", "Company, Name, Item No.");


ALTER TABLE building AUTO_INCREMENT=14000;
INSERT INTO building(description, debit, credit, purchaseDate, depreciationLife, receiptID) VALUES("null description", "0", "0", "2022/01/01", "0", "0");


ALTER TABLE buildingImprovements AUTO_INCREMENT=15000;
INSERT INTO buildingImprovements(description, debit, credit, depreciationLife) VALUES("Imp. Name", "0", "0", "0");


ALTER TABLE landImprovements AUTO_INCREMENT=16000;
INSERT INTO landImprovements(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE computerEquipment AUTO_INCREMENT=171000;
INSERT INTO computerEquipment(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE storeEquipment AUTO_INCREMENT=172000;
INSERT INTO storeEquipment(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE machineryEquipment AUTO_INCREMENT=173000;
INSERT INTO machineryEquipment(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE officeEquipment AUTO_INCREMENT=174000;
INSERT INTO officeEquipment(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE shopEquipment AUTO_INCREMENT=175000;
INSERT INTO shopEquipment(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE accountsPayable AUTO_INCREMENT=21000;
INSERT INTO accountsPayable(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE unearnedSalesRevenue AUTO_INCREMENT=22000;
INSERT INTO unearnedSalesRevenue(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE allowanceForDoubtfulAccounts AUTO_INCREMENT=23000;
INSERT INTO allowanceForDoubtfulAccounts(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE capital AUTO_INCREMENT=31000;
INSERT INTO capital(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE drawings AUTO_INCREMENT=31000;
INSERT INTO drawings(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE salesRevenue AUTO_INCREMENT=41000;
INSERT INTO salesRevenue(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE suppliesExpense AUTO_INCREMENT=51000;
INSERT INTO suppliesExpense(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE utilitiesExpense AUTO_INCREMENT=52000;
INSERT INTO utilitiesExpense(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE travelExpense AUTO_INCREMENT=53000;
INSERT INTO travelExpense(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE deliveryExpense AUTO_INCREMENT=54000;
INSERT INTO deliveryExpense(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE rentExpense AUTO_INCREMENT=55000;
INSERT INTO rentExpense(description, debit, credit) VALUES("Name", "0", "0");


ALTER TABLE salaryExpense AUTO_INCREMENT=56000;
INSERT INTO salaryExpense(description, debit, credit) VALUES("Name", "0", "0");