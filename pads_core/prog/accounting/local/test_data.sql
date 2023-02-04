USE accounting;

insert into rawMaterials(category, make, model, inchesPerUnit, inchesPerPc, pcsPerCs) values("Clear", "Northstar", "Tube", "12", "48", "25");
insert into rmIn(snid, category, make, model, debit, pcsIn, invoiceID) values("131001", "Clear", "Northstar", "Tube", "300", "15", "12345");
insert into rmOut(snid, category, make, model, units, waste, rnd) values("131001", "Clear", "Northstar", "Tube", "5", "2", "10");
insert into productionWork(model, description, msrp, wholesale, inchesPerUnit) values("AG Spoon", "Frit, Logo, Color", "40", "15", "4");
insert into pwIn(snid, model, unitsIn) values("132001", "AG Spoon", "10");
insert into pwOut(snid, model, unitsOut) values("132001", "AG Spoon", "5");
insert into storeInventory(description, msrp, unitsPerCs) values("Grinder", "20", "40");
insert into siIn(snid, description, debit, unitsIn) values("135001", "Grinder", "100", "10");
insert into siOut(snid, description, unitsOut) values("135001", "Grinder", "5");
insert into customWork(model, description, debit, credit) values("Sky Night", "A starry night, in the depths of insanity", "250", "250"),("Death is Life", "Chain me to the brink of starvation!", "500", "0");
insert into prototypes(model, description, debit, credit) values("AGSpoon-001", "Test color combo", "10", "10"),("AGSpoon-002", "Test size of piece", "10", "10");
