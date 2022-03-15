




CREATE TABLE `hotel` (
  `HotelID` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Phone` int DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`HotelID`,`Name`),
  KEY `Name` (`Name`)
);

CREATE TABLE `guest` (
  `GuestID` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GuestID`),
  KEY `Name` (`Name`)
);

CREATE TABLE `pointofinterest` (
  `POIID` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`POIID`),
  KEY `Name` (`Name`),
  CONSTRAINT `pointofinterest_ibfk_1` FOREIGN KEY (`Name`) REFERENCES `hotel` (`Name`)
);



CREATE TABLE `hoteltopoi` (
  `POIID` varchar(20) DEFAULT NULL,
  `HotelID` varchar(20) DEFAULT NULL,
  KEY `POIID` (`POIID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `hoteltopoi_ibfk_1` FOREIGN KEY (`POIID`) REFERENCES `pointofinterest` (`POIID`),
  CONSTRAINT `hoteltopoi_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`)
);


CREATE TABLE `rooms_available` (
  `RoomID` varchar(20) NOT NULL,
  `HotelID` varchar(20) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `rooms_available_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`)
);

CREATE TABLE `room` (
  `RoomID` varchar(20) DEFAULT NULL,
  `HotelID` varchar(20) DEFAULT NULL,
  `RoomNumber` int DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  KEY `RoomID` (`RoomID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `rooms_available` (`RoomID`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`)
);

CREATE TABLE `roomtoamenity` (
  `RoomID` varchar(20) DEFAULT NULL,
  `AmenityID` varchar(20) NOT NULL,
  PRIMARY KEY (`AmenityID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `roomtoamenity_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `rooms_available` (`RoomID`)
);

CREATE TABLE `reservation` (
  `GuestID` varchar(20) DEFAULT NULL,
  `RoomID` varchar(20) DEFAULT NULL,
  `Startdate` datetime DEFAULT NULL,
  `Enddate` datetime DEFAULT NULL,
  `ConfirmNumber` int DEFAULT NULL,
  KEY `GuestID` (`GuestID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`GuestID`) REFERENCES `guest` (`GuestID`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`)
);






CREATE TABLE amenity(
  AmenityID varchar(20) DEFAULT NULL,
  Name varchar(20) DEFAULT NULL,
  KEY AmenityID (AmenityID),
  KEY Name (Name),
  CONSTRAINT amenity_ibfk_1 FOREIGN KEY (AmenityID) REFERENCES roomtoamenity (AmenityID)
);


insert into hotel (HotelID,Name,Phone,Address) values ('Del Luna','Del Luna',12354,'198 West 21th street,Suite 721 New York NY 10016');
insert into rooms_available(RoomID,HotelID,Available) value ('Regular','Del Luna',1),('Executive','Del Luna',1),('Presidential','Del Luna',1);
insert into room (RoomID,HotelID,RoomNumber,Rate) values ('Regular','Del Luna',90,50),('Executive','Del Luna',75,75),('Presidential','Del Luna',42,100);
INSERT INTO roomtoamenity(RoomID,AmenityID) values ('Regular','#1'),('Regular','#2'),('Executive','#3'),('Executive','#4'),('Executive','#5'),('Executive','#6');
insert into amenity (AmenityID,Name) values ('#1','POOL'),('#2','BAR'),('#3','PICK-UP'),('#4','PICK-UP'),('#5','SPA'),('#6','GYM');
DELETE FROM room
WHERE HotelID = 'Del Luna';
select *from roomtoamenity;
select *from rooms_available;
select *from room;
select *from reservation;
select *from pointofinterest;
select *from hoteltopoi;
select *from hotel;
select *from guest;
select *from amenity;

show indexes from employees;