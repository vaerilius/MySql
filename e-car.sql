DROP TABLE IF EXISTS Kayttaja; 
 
-- Table structure for table Kayttaja
CREATE TABLE Kayttaja ( 
  kayttajaID INT NOT NULL, 
  etuNimi VARCHAR(16) NOT NULL, 
  sukuNimi VARCHAR(32) NOT NULL, 
  paikkaKunta VARCHAR(16) NOT NULL, 
  sahkoPosti VARCHAR(32) NOT NULL,
  PRIMARY KEY (kayttajaID) 
); 
CREATE TABLE LatausYritykset ( 
  latausYritysID INT NOT NULL, 
  yritysNimi VARCHAR(32) NOT NULL, 
  hinta DECIMAL(4,2) NOT NULL, 
  latauspisteidenmaara INT NOT NULL,
  PRIMARY KEY (latausYritysID) 
); 

INSERT INTO LatausYritykset VALUES 
(1, 'Kaari', 5,10,3),
(2, 'Jumbo', 3,5,5),
(3, 'Itis', 4,4,2),
(4, 'Sello', 5,00,4),
(5, 'Redi', 2,30,4);

 
-- Inserting new records for table 
INSERT INTO kayttaja VALUES 
(1, 'Meija', 'Opetaja','Vantaa', 'meija@hotmail.fi'), 
(2, 'Timo', 'Tamminen','Helsinki', 'timo@gmail.com'), 
(3, 'Lari', 'Vesterinen','Espoo', 'lari@lari.com'), 
(4, 'Pate', 'Johansson','Porvoo', 'pate@puuha.org'),
(5, 'Pekka', 'Puu','Espoo', 'pleksi@gmail.com'); 
-- ----------------------------------------------------------------------- 
-- 
-- Drop table in case it exist in the database 
DROP TABLE IF EXISTS KayttajaVaraus; 
 
-- Table structure for table EMPLOYEE 
CREATE TABLE KayttajaVaraus ( 
  varausID INT NOT NULL, 
  kayttajaID INT NOT NULL,
  FOREIGN KEY (varausID) REFERENCES Varaus (varausID),
  FOREIGN KEY (kayttajaID) REFERENCES Kayttaja (kayttajaID)
); 
 
-- Drop table in case it exist in the database 
DROP TABLE IF EXISTS Latauspiste; 
 
-- Table structure for table Latauspiste
CREATE TABLE Latauspiste ( 
    latausPisteID INT NOT NULL,
    latausPaikkakunta VARCHAR(32) NOT NULL, 
    latauspisteYritys VARCHAR(32) NOT NULL,
    pisteenTilanne BOOLEAN NOT NULL,
    latausYritysID INT,
    FOREIGN KEY (latausYritysID) REFERENCES LatausYritykset (latausYritysID),
    PRIMARY KEY (latausPisteID) 
); 
 
-- Inserting new records for table 
INSERT INTO Latauspiste VALUES 
(1, 'Basic'), 
('KJM-001', 'Emergency'), 
('FCE-873', 'Emergency'); 
-- ----------------------------------------------------------------------- 
-- 
-- Drop table in case it exist in the database 
DROP TABLE IF EXISTS VARAUS; 
 
-- Table structure for table VARAUS 
CREATE TABLE VARAUS ( 
  VARAUSID INT NOT NULL, 
  CustomerID INT NOT NULL, 
  VARAUSDate date NOT NULL, 
  StartTime time NOT NULL, 
  EndTime time NOT NULL, 
  PlateNr VARCHAR(7) NOT NULL, 
  PRIMARY KEY (VARAUSID), 
  FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID), 
  FOREIGN KEY (PlateNr) REFERENCES AMBULANCE(PlateNr) 
); 
 
-- Inserting new records for table 
INSERT INTO VARAUS VALUES 
(2334, 4, '2016-02-20', '08:00', '09:00', 'IXC-233'), 
(3442, 4, '2016-02-21', '14:00', '15:00', 'IXC-233'), 
(1101, 1, '2016-03-02', '13:15', '14:00', 'KJM-001'), 
(4565, 3, '2016-03-01', '21:40', '22:30', 'FCE-873'); 
-- ----------------------------------------------------------------------- 
-- 
-- Drop table in case it exist in the database 
DROP TABLE IF EXISTS CREW_RIDE; 
 
-- Table structure for table CREW_RIDE 
CREATE TABLE CREW_RIDE ( 
  VARAUSID INT NOT NULL, 
  EmployeeID INT NOT NULL, 
  PRIMARY KEY (VARAUSID,EmployeeID), 
  FOREIGN KEY (VARAUSID) REFERENCES VARAUS(VARAUSID), 
  FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID) 
); 
 
-- Inserting new records for table 
INSERT INTO CREW_RIDE VALUES 
(2334, 102), 
(3442, 102), 
(1101, 103), 
(1101, 104), 
(1101, 105), 
(4565, 102), 
(4565, 105); 
-- ----------------------------------------------------------------------- 