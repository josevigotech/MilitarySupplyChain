DROP TABLE IF EXISTS AssignmentDetails;
DROP TABLE IF EXISTS Missions;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS EquipmentCategories;
DROP TABLE IF EXISTS BaseDestinations;
DROP TABLE IF EXISTS MilitaryPersonnel;
DROP TABLE IF EXISTS LogisticsTransport;
DROP TABLE IF EXISTS MilitarySuppliers;

CREATE TABLE EquipmentCategories(
    CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
    CategoryName TEXT,
    Description TEXT
);

CREATE TABLE BaseDestinations(
    BaseID INTEGER PRIMARY KEY AUTOINCREMENT,
    BaseName TEXT,
    CommandingOfficer TEXT,
    Address TEXT,
    City TEXT,
    PostalCode TEXT,
    Country TEXT
);

CREATE TABLE MilitaryPersonnel(
    PersonnelID INTEGER PRIMARY KEY AUTOINCREMENT,
    LastName TEXT,
    FirstName TEXT,
    EnlistmentDate DATE,
    InsigniaPhoto TEXT,
    ServiceRecord TEXT
);

CREATE TABLE LogisticsTransport(
    TransportID INTEGER PRIMARY KEY AUTOINCREMENT,
    VehicleName TEXT,
    BasePhone TEXT
);

CREATE TABLE MilitarySuppliers(
    SupplierID INTEGER PRIMARY KEY AUTOINCREMENT,
    ContractorName TEXT,
    ContactName TEXT,
    Address TEXT,
    City TEXT,
    PostalCode TEXT,
    Country TEXT,
    Phone TEXT
);

CREATE TABLE Equipment(
    EquipmentID INTEGER PRIMARY KEY AUTOINCREMENT,
    EquipmentName TEXT,
    SupplierID INTEGER,
    CategoryID INTEGER,
    Specification TEXT,
    UnitPrice NUMERIC DEFAULT 0,
    FOREIGN KEY (CategoryID) REFERENCES EquipmentCategories (CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES MilitarySuppliers (SupplierID)
);

CREATE TABLE Missions(
    MissionID INTEGER PRIMARY KEY AUTOINCREMENT,
    BaseID INTEGER,
    PersonnelID INTEGER,
    AssignmentDate DATETIME,
    TransportID INTEGER,
    FOREIGN KEY (PersonnelID) REFERENCES MilitaryPersonnel (PersonnelID),
    FOREIGN KEY (BaseID) REFERENCES BaseDestinations (BaseID),
    FOREIGN KEY (TransportID) REFERENCES LogisticsTransport (TransportID)
);

CREATE TABLE AssignmentDetails(
    AssignmentDetailID INTEGER PRIMARY KEY AUTOINCREMENT,
    MissionID INTEGER,
    EquipmentID INTEGER,
    QuantityAssigned INTEGER,
    FOREIGN KEY (MissionID) REFERENCES Missions (MissionID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
);

-- Equipment Categories Data
INSERT INTO EquipmentCategories VALUES(1,'Small Arms','Assault rifles, handguns, submachine guns, and machine guns');
INSERT INTO EquipmentCategories VALUES(2,'Ammunition','Rifle rounds, artillery shells, and tactical ammunition');
INSERT INTO EquipmentCategories VALUES(3,'Armored Vehicles','Tanks, armored personnel carriers, and tactical utility vehicles');
INSERT INTO EquipmentCategories VALUES(4,'Communications','Long-range radios, satellite transceivers, and encryption gear');
INSERT INTO EquipmentCategories VALUES(5,'Tactical Gear','Helmets, body armor, night vision goggles, and field equipment');
INSERT INTO EquipmentCategories VALUES(6,'Artillery','Mortars, howitzers, and tactical missile systems');
INSERT INTO EquipmentCategories VALUES(7,'Medical Supplies','Combat first aid kits, stretchers, and field hospital equipment');
INSERT INTO EquipmentCategories VALUES(8,'Combat Engineering','EOD kits, breaching gear, and tactical bridging equipment');

-- Military Bases / Destinations Data
INSERT INTO BaseDestinations VALUES(1,'Alpha Base - Northern Sector','Gen. Marcus Vance','57 Military Zone','Berlin','12209','Germany');
INSERT INTO BaseDestinations VALUES(2,'Fort Bravo','Col. Sofia Rivas','2222 Central Ave','Mexico City','5021','Mexico');
INSERT INTO BaseDestinations VALUES(3,'Centaur Outpost','Capt. Alejandro Maza','2312 Arsenal St','Mexico City','5023','Mexico');
INSERT INTO BaseDestinations VALUES(4,'Coastal Command HQ','Lt. Col. Thomas Hardy','120 Naval Base','London','WA1 1DP','UK');
INSERT INTO BaseDestinations VALUES(5,'Nordic Garrison','Capt. Christina Berglund','8 Polar Sector','Luleå','S-958 22','Sweden');

-- Military Personnel Data
INSERT INTO MilitaryPersonnel VALUES(1,'Davolio','Nancy','1968-12-08','Officer1.pic','Advanced logistics and tactical deployment specialist in high-risk zones.');
INSERT INTO MilitaryPersonnel VALUES(2,'Fuller','Andrew','1952-02-19','Officer2.pic','Major General with extensive experience in international strategy and supply chain management.');
INSERT INTO MilitaryPersonnel VALUES(3,'Leverling','Janet','1963-08-30','Officer3.pic','Armament control specialist managing ammo depots and inventory tracking.');
INSERT INTO MilitaryPersonnel VALUES(4,'Peacock','Margaret','1958-09-19','Officer4.pic','Combat medical coordinator managing emergency supplies in theater.');
INSERT INTO MilitaryPersonnel VALUES(5,'Buchanan','Steven','1955-03-04','Officer5.pic','Special operations commander in charge of rapid deployment forces.');

-- Logistics Transport Data
INSERT INTO LogisticsTransport VALUES(1, 'C-130 Hercules Transport', '(503) 555-9831');
INSERT INTO LogisticsTransport VALUES(2, '6x6 Tactical Truck', '(503) 555-3199');
INSERT INTO LogisticsTransport VALUES(3, 'Mil Mi-17 Transport Helicopter', '(503) 555-9931');

-- Military Defense Contractors / Suppliers Data
INSERT INTO MilitarySuppliers VALUES(1,'Global Defense Systems','Charlotte Cooper','49 Gilbert St.','London','EC1 4SD','UK','(171) 555-2222');
INSERT INTO MilitarySuppliers VALUES(2,'Tactical Armament Corp','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA','(100) 555-4822');
INSERT INTO MilitarySuppliers VALUES(3,'Vanguard Logistics','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA','(313) 555-5735');
INSERT INTO MilitarySuppliers VALUES(4,'Pacific Defense Industries','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan','(03) 3555-5011');
INSERT INTO MilitarySuppliers VALUES(5,'Northern Ordnance','Antonio del Valle','4 Calle del Rosal','Oviedo','33007','Spain','(98) 598 76 54');

-- Equipment / Inventory Items Data
INSERT INTO Equipment VALUES(1,'M4A1 Assault Rifle',1,1,'5.56mm NATO with optical sight',1200.00);
INSERT INTO Equipment VALUES(2,'Beretta 9mm Pistol',1,1,'Standard issue semi-automatic handgun',450.00);
INSERT INTO Equipment VALUES(3,'5.56mm Ammo Crate (1000 rds)',1,2,'Standard FMJ military grade',250.00);
INSERT INTO Equipment VALUES(4,'M203 Grenade Launcher',2,6,'Under-barrel attachment for assault rifle',1800.00);
INSERT INTO Equipment VALUES(5,'60mm Light Mortar',2,6,'Indirect fire support system',3500.00);
INSERT INTO Equipment VALUES(6,'NVG Night Vision Kit',3,5,'Gen 3 dual-tube infrared binocular',2400.00);
INSERT INTO Equipment VALUES(7,'Level IV Body Armor',3,5,'Reinforced ceramic plate carrier',850.00);
INSERT INTO Equipment VALUES(8,'Tactical Satellite Radio',4,4,'Encrypted ruggedized field unit',1500.00);

-- Missions / Deployment Orders Data
INSERT INTO Missions VALUES(10248,1,5,'2026-07-04',3);
INSERT INTO Missions VALUES(10249,2,6,'2026-07-05',1);
INSERT INTO Missions VALUES(10250,3,4,'2026-07-08',2);
INSERT INTO Missions VALUES(10251,4,3,'2026-07-08',1);
INSERT INTO Missions VALUES(10252,5,4,'2026-07-09',2);

-- Assignment Details Data (Equipment issued per mission)
INSERT INTO AssignmentDetails VALUES(1, 10248, 1, 50);
INSERT INTO AssignmentDetails VALUES(2, 10248, 3, 20);
INSERT INTO AssignmentDetails VALUES(3, 10249, 2, 30);
INSERT INTO AssignmentDetails VALUES(4, 10250, 6, 15);
INSERT INTO AssignmentDetails VALUES(5, 10251, 7, 40);
