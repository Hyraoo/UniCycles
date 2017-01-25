CREATE DATABASE Unicycles;

CREATE TABLE User (
User_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
Forename VARCHAR(20) NOT NULL,
Surname VARCHAR(20) NOT NULL,
DoB DATE NOT NULL,
Email_Address VARCHAR(45) UNIQUE NOT NULL,
Phone VARCHAR(15) UNIQUE NOT NULL,
Is_Student BOOLEAN DEFAULT FALSE,
Is_Lecturer BOOLEAN DEFAULT FALSE,
Is_Other_Staff BOOLEAN DEFAULT FALSE,
UP_Number VARCHAR(6) UNIQUE
);

CREATE TABLE Depot (
Depot_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
Maximum_Storage INTEGER NOT NULL,
Depot_Location VARCHAR(200) NOT NULL
);

INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (1,30,"University North Quater (Portland Building)")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (2,40,"University Libary")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (3,25,"Gunwarf Quays")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (4,15,"Portsmouth and Southsea Train Station")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (5,20,"Fratton Train Station")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (6,50,"Langstone University Halls")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (7,20,"Southsea Castle (Beach Front)")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (8,15,"St Marys Hospital")
INSERT INTO Depot (Depot_ID,Maximum_Storage,Depot_Location) VALUES (9,35,"University Park Building")

CREATE TABLE Bike (
Bike_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
Bike_Type VARCHAR(20) NOT NULL,
Working_Condition BOOLEAN DEFAULT TRUE,
Depot_ID INTEGER NOT NULL FOREIGN KEY,
Insured BOOLEAN DEFAULT TRUE,

CONSTRAINT FOREIGN KEY (Depot_ID) REFERENCES Depot (Depot_ID) );

CREATE TABLE Bike_Store (
Store_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
Store_Name VARCHAR(30) NOT NULL,
Owner_Forename VARCHAR(20) NOT NULL,
Owner_Surname VARCHAR(20) NOT NULL,
Store_Email VARCHAR(45) NOT NULL,
Store_Phone VARCHAR(15) NOT NULL,
Store_Address VARCHAR(200) NOT NULL
);

INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (1,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (2,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (3,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (4,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (5,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (6,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (7,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (8,)
INSERT INTO Bike_Store (Store_ID,Store_Name,Owner_Forename,Owner_Surname,Store_Email,Store_Phone,Store_Address) VALUES (9,)

CREATE TABLE Store_Sold_Bike (
Bike_IDINTEGER NOT NULL FOREIGN KEY,
Store_ID INTEGER NOT NULL FOREIGN KEY,

CONSTRAINT FOREIGN KEY (Bike_ID) REFERENCES Bike (Bike_ID),
CONSTRAINT FOREIGN KEY (Store_ID) REFERENCES Store (Store_ID) );

CREATE TABLE REQUEST (
Request_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
User_ID INTEGER NOT NULL FOREIGN KEY,
Bike_From VARCHAR(200) NOT NULL,
Bike_To VARCHAR(200) NOT NULL,
Bike_ID INTEGER NOT NULL FOREIGN KEY,
Time_Of_Departure TIME NOT NULL,
Date_Of_Departure DATE NOT NULL,

CONSTRAINT FOREIGN KEY (Bike_ID) REFERENCES Bike (Bike_ID),
CONSTRAINT FOREIGN KEY (User_ID) REFERENCES User (User_ID) );
