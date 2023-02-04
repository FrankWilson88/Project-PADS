USE accounting;


CREATE VIEW IF NOT EXISTS qac1 AS
SELECT
  SUM(valueLoaned) as debit,
  SUM(valuePayed) as credit,
  SUM(defaultAmount) as totalDefault
FROM accountsReceivable
;

SELECT VIEW IF NOT EXISTS qinv1