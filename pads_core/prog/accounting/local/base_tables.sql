-- Create DB and start
CREATE DATABASE IF NOT EXISTS accounting;
USE accounting;

-- Create Chart of Accounts or PASS if already made
-- Accounts Receivable #12001
CREATE TABLE IF NOT EXISTS accountsReceivable(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  valueLoaned decimal(7,2),
  defaultAmount decimal(7,2),
  unitsLoaned int(5),
  valuePayed decimal(7,2),
  dateOpened datetime,
  dateClosed datetime,
  dueDate datetime,
  customerID int,
  recieptID int,
  PRIMARY KEY(snid)
);


/*
Inventory #13x
*/
-- Raw Materials #131001
CREATE TABLE IF NOT EXISTS rawMaterials(
  snid int(7) NOT NULL AUTO_INCREMENT,
  category ENUM("Clear", "Color", "Joint", "Dichro", "Opal") NOT NULL,
  make varchar(30) NOT NULL,
  model ENUM("Tube", "Rod", "Frit", "Sheets", "Strips", "Tumbled;Polished", "Crushed/Rough", "Sample") NOT NULL,
  diameter decimal(7,2),
  thickness decimal(7,2),
  inchesPerUnit int(2),
  inchesPerPc int(2),
  pcsPerCs decimal(7,2),
  oz decimal(7,2),
  PRIMARY KEY(snid)
);

CREATE TABLE IF NOT EXISTS rmIn(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL,
  category varchar(30) NOT NULL,
  make varchar(30) NOT NULL,
  model varchar(30) NOT NULL,
  debit decimal(7,2) NOT NULL,
  pcsIn int(4) NOT NULL,
  invoiceID varchar(50) NOT NULL,
  purchaseDate datetime,
  FOREIGN KEY(snid) REFERENCES rawMaterials(snid)
);

CREATE TABLE IF NOT EXISTS rmOut(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL,
  category varchar(30) NOT NULL,
  make varchar(30) NOT NULL,
  model varchar(30) NOT NULL,
  units int(3),
  waste int(3),
  rnd int(3),
  FOREIGN KEY(snid) REFERENCES rawMaterials(snid)
);


-- Production Work #132001
CREATE TABLE IF NOT EXISTS productionWork(
  snid int(7) NOT NULL AUTO_INCREMENT,
  model varchar(25) NOT NULL,
  description varchar(50) NOT NULL,
  msrp decimal(7,2) NOT NULL,
  wholesale decimal(7,2) NOT NULL,
  inchesPerUnit int(2) NOT NULL,
  image longblob,
  image2 longblob,
  image3 longblob,
  image4 longblob,
  image5 longblob,
  link varchar(255),
  PRIMARY KEY(snid)
);
CREATE TABLE IF NOT EXISTS pwIn(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL,
  model varchar(25) NOT NULL,
  unitsIn int(3) NOT NULL,
  FOREIGN KEY(snid) REFERENCES productionWork(snid)
);

CREATE TABLE IF NOT EXISTS pwOut(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL,
  model varchar(25) NOT NULL,
  unitsOut int(3) NOT NULL,
  FOREIGN KEY(snid) REFERENCES productionWork(snid)
);


-- Custom Work #133001
CREATE TABLE IF NOT EXISTS customWork(
  snid int(7) NOT NULL AUTO_INCREMENT,
  model varchar(50) NOT NULL,
  description TEXT NOT NULL,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  mfgDate datetime,
  image BLOB,
  image2 BLOB,
  image3 BLOB,
  image4 BLOB,
  image5 BLOB,
  link varchar(255),
  invoiceID varchar(25),
  customerID int(7),
  employeeID int(7),
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY(snid)
);


-- Prototypes #134001
CREATE TABLE IF NOT EXISTS prototypes(
  snid int(7) NOT NULL AUTO_INCREMENT,
  model varchar(50) NOT NULL,
  description varchar(50) NOT NULL,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  image BLOB,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY(snid)
);


-- Store Inventory #135001
CREATE TABLE IF NOT EXISTS storeInventory(
  snid int(7) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  msrp decimal(7,2) NOT NULL,
  unitsPerCs int(3) NOT NULL,
  image BLOB,
  image2 BLOB,
  image3 BLOB,
  image4 BLOB,
  image5 BLOB,
  link varchar(255),
  PRIMARY KEY(snid)
);
CREATE TABLE IF NOT EXISTS siIn(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  purchaseDate datetime,
  unitsIn int(3),
  invoiceID varchar(25),
  FOREIGN KEY(snid) REFERENCES storeInventory(snid)
);
CREATE TABLE IF NOT EXISTS siOut(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL,
  description varchar(50) NOT NULL,
  unitsOut int(3),
  FOREIGN KEY(snid) REFERENCES storeInventory(snid)
);


-- Building #14001
CREATE TABLE IF NOT EXISTS building(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  purchaseDate datetime NOT NULL,
  depreciationLife int(2) NOT NULL,
  receiptID varchar(16) NOT NULL,
  PRIMARY KEY(snid)
);


-- Building Improvements #15001
CREATE TABLE IF NOT EXISTS buildingImprovements(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  purchaseDate datetime,
  depreciationLife int(2) NOT NULL,
  receiptID varchar(50),
  PRIMARY KEY(snid)
);


-- Land Improvements #16001
CREATE TABLE IF NOT EXISTS landImprovements(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  purchaseDate datetime,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


/*
Furniture and Fixtures #17x
*/
-- Computer Equipment #171001
CREATE TABLE IF NOT EXISTS computerEquipment(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  credit decimal(7,2),
  purchaseDate datetime,
  depreciationLife decimal(2,2),
  receiptID varchar(25),
  PRIMARY KEY(snid)
);

-- Store Equipment #172001
CREATE TABLE IF NOT EXISTS storeEquipment(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  credit decimal(7,2),
  purchaseDate datetime,
  depreciationLife decimal(7,2),
  receiptID varchar(25),
  PRIMARY KEY(snid)
);

-- Machinery and Equipment #173001
CREATE TABLE IF NOT EXISTS machineryEquipment(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  credit decimal(7,2),
  purchaseDate datetime,
  depreciationLife decimal(7,2),
  receiptID varchar(25),
  PRIMARY KEY(snid)
);

-- Office Equipment #174001
CREATE TABLE IF NOT EXISTS officeEquipment(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  credit decimal(7,2),
  purchaseDate datetime,
  depreciationLife decimal(7,2),
  receiptID varchar(25),
  PRIMARY KEY(snid)
);

-- Shop Equipment #175001
CREATE TABLE IF NOT EXISTS shopEquipment(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(7) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  credit decimal(7,2),
  purchaseDate datetime,
  depreciationLife decimal(7,2),
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Accounts Payable #21001
CREATE TABLE IF NOT EXISTS accountsPayable(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50),
  debit decimal(7,2),
  credit decimal(7,2),
  dateOpened datetime,
  dateClosed datetime,
  dueDate datetime,
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Unearned Sales Revenue #22001
CREATE TABLE IF NOT EXISTS unearnedSalesRevenue(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  credit decimal(7,2),
  dateOpen datetime,
  dateClosed datetime,
  dueDate datetime,
  customerID int,
  receiptID int,
  PRIMARY KEY(snid)
);


-- Allowance for Doubtful Accounts #23001
CREATE TABLE IF NOT EXISTS allowanceForDoubtfulAccounts(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  debit decimal(7,2),
  credit decimal(7,2),
  customerID int,
  receiptID int,
  PRIMARY KEY(snid)
);


-- Capital #31001
CREATE TABLE IF NOT EXISTS capital(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  transactionDate datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Drawings #32001
CREATE TABLE IF NOT EXISTS drawings(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  transactionDate datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Sales Revenue #41001
CREATE TABLE IF NOT EXISTS salesRevenue(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  saleDate datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Supplies Expense #51001
CREATE TABLE IF NOT EXISTS suppliesExpense(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  date datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Utilities Expense #52001
CREATE TABLE IF NOT EXISTS utilitiesExpense(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  dueDate datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Travel Expense #53001
CREATE TABLE IF NOT EXISTS travelExpense(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  date datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Delivery Expense #54001
CREATE TABLE IF NOT EXISTS deliveryExpense(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  date datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Rent Expense #55001
CREATE TABLE IF NOT EXISTS rentExpense(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  date datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);


-- Salary Expense #56001
CREATE TABLE IF NOT EXISTS salaryExpense(
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  snid int(5) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  date datetime,
  debit decimal(7,2) NOT NULL,
  credit decimal(7,2),
  customerID int,
  receiptID varchar(25),
  PRIMARY KEY(snid)
);