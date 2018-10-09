-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

DROP TABLE `ExpensesDetails`;


DROP TABLE `BillingDetails`;


DROP TABLE `Pricing`;


DROP TABLE `AccomodationDetails`;


DROP TABLE `BookingDetails`;


DROP TABLE `Reviews`;


DROP TABLE `Logs`;


DROP TABLE `Expense`;


DROP TABLE `Billing`;


DROP TABLE `Accomodation`;


DROP TABLE `Booking`;


DROP TABLE `Sessions`;


DROP TABLE `Users`;



-- ************************************** `Users`

CREATE TABLE `Users`
(
 `userID`           INT NOT NULL ,
 `surname`          VARCHAR(55) NOT NULL ,
 `name`             VARCHAR(55) NOT NULL ,
 `prefferedName`    VARCHAR(55) ,
 `registrationType` VARCHAR(30) NOT NULL ,
 `age`              INT NOT NULL ,
 `address1`         VARCHAR(55) NOT NULL ,
 `address2`         VARCHAR(55) ,
 `town`             VARCHAR(55) NOT NULL ,
 `email`            VARCHAR(55) NOT NULL ,
 `password`         VARCHAR(55) NOT NULL ,
 `userType`         VARCHAR(55) NOT NULL ,
 `homePhone`        VARCHAR(55) ,
 `mobilePhone`      VARCHAR(55) NOT NULL ,
 `dateModified`     DATE ,
 `dateCreated`      DATE NOT NULL ,
 `nationality`      VARCHAR(55) NOT NULL ,
 `nic`              VARCHAR(55) NOT NULL ,

PRIMARY KEY (`userID`)
);






-- ************************************** `Expense`

CREATE TABLE `Expense`
(
 `expenseID`           INT NOT NULL ,
 `customer`            VARCHAR(55) NOT NULL ,
 `details_description` VARCHAR(75) NOT NULL ,
 `brn_vatNumber`       INT NOT NULL ,
 `Status`              VARCHAR(55) NOT NULL ,
 `userID`              INT NOT NULL ,

PRIMARY KEY (`expenseID`),
KEY `fkIdx_240` (`userID`),
CONSTRAINT `FK_240` FOREIGN KEY `fkIdx_240` (`userID`) REFERENCES `Users` (`userID`)
);






-- ************************************** `Billing`

CREATE TABLE `Billing`
(
 `billingID`      INT NOT NULL ,
 `userID`         INT NOT NULL ,
 `bill_numID`     INT NOT NULL ,
 `totalVatExcl`   FLOAT NOT NULL ,
 `totalVatIncl`   FLOAT NOT NULL ,
 `discountAmount` FLOAT ,
 `totalVat`       FLOAT NOT NULL ,
 `discountCode`   INT ,
 `amountPaid`     FLOAT ,
 `amountReturned` FLOAT NOT NULL ,

PRIMARY KEY (`billingID`),
KEY `fkIdx_201` (`userID`),
CONSTRAINT `FK_201` FOREIGN KEY `fkIdx_201` (`userID`) REFERENCES `Users` (`userID`)
);






-- ************************************** `Accomodation`

CREATE TABLE `Accomodation`
(
 `accomodationID`             INT NOT NULL ,
 `userID`                     INT NOT NULL ,
 `type`                       VARCHAR(55) NOT NULL ,
 `shortDescription`           VARCHAR(55) ,
 `longDescription`            VARCHAR(55) ,
 `address1`                   VARCHAR(55) NOT NULL ,
 `address2`                   VARCHAR(55) ,
 `town`                       VARCHAR(55) NOT NULL ,
 `lattitude`                  VARCHAR(55) ,
 `longitude`                  VARCHAR(55) ,
 `agreement_acceptation`      VARCHAR(55) NOT NULL ,
 `agreement_acceptation_date` DATE NOT NULL ,
 `features`                   VARCHAR(55) NOT NULL ,
 `capacity`                   VARCHAR(55) NOT NULL ,
 `dateCreated`                DATE NOT NULL ,
 `dateModified`               DATE ,
 `createdBy`                  VARCHAR(55) NOT NULL ,
 `modifiedBy`                 VARCHAR(55) ,

PRIMARY KEY (`accomodationID`),
KEY `fkIdx_152` (`userID`),
CONSTRAINT `FK_152` FOREIGN KEY `fkIdx_152` (`userID`) REFERENCES `Users` (`userID`)
);






-- ************************************** `Booking`

CREATE TABLE `Booking`
(
 `bookingID`    INT NOT NULL ,
 `itemsCounts`  INT NOT NULL ,
 `status`       VARCHAR(55) NOT NULL ,
 `bookingNumID` INT NOT NULL ,
 `userID`       INT NOT NULL ,

PRIMARY KEY (`bookingID`),
KEY `fkIdx_79` (`userID`),
CONSTRAINT `FK_79` FOREIGN KEY `fkIdx_79` (`userID`) REFERENCES `Users` (`userID`)
);






-- ************************************** `Sessions`

CREATE TABLE `Sessions`
(
 `sessionID`       INT NOT NULL ,
 `loginTimestamp`  INT NOT NULL ,
 `logoutTimestamp` INT NOT NULL ,
 `dateCreated`     DATE NOT NULL ,
 `dateModified`    DATE ,
 `createdBy`       VARCHAR(55) NOT NULL ,
 `modifiedBy`      VARCHAR(55) ,
 `userID`          INT NOT NULL ,

PRIMARY KEY (`sessionID`),
KEY `fkIdx_50` (`userID`),
CONSTRAINT `FK_50` FOREIGN KEY `fkIdx_50` (`userID`) REFERENCES `Users` (`userID`)
);






-- ************************************** `ExpensesDetails`

CREATE TABLE `ExpensesDetails`
(
 `expenseDetailsID`      INT NOT NULL ,
 `expensesDetails_numId` INT NOT NULL ,
 `amountVatExcl`         FLOAT NOT NULL ,
 `amountVatIncl`         FLOAT NOT NULL ,
 `description`           VARCHAR(55) NOT NULL ,
 `paymentMethod`         VARCHAR(55) NOT NULL ,
 `validatedBy`           VARCHAR(55) NOT NULL ,
 `dateValidated`         DATE NOT NULL ,
 `createdBy`             VARCHAR(55) NOT NULL ,
 `modifiedBy`            VARCHAR(55) NOT NULL ,
 `dateCreated`           DATE NOT NULL ,
 `dateModified`          DATE ,
 `expenseID`             INT NOT NULL ,

PRIMARY KEY (`expenseDetailsID`),
KEY `fkIdx_257` (`expenseID`),
CONSTRAINT `FK_257` FOREIGN KEY `fkIdx_257` (`expenseID`) REFERENCES `Expense` (`expenseID`)
);






-- ************************************** `BillingDetails`

CREATE TABLE `BillingDetails`
(
 `billingDetailsID`     INT NOT NULL ,
 `status`               VARCHAR(55) NOT NULL ,
 `billingDetails_numID` INT NOT NULL ,
 `dateCreated`          DATE NOT NULL ,
 `dateModified`         DATE ,
 `createdBy`            VARCHAR(55) NOT NULL ,
 `modifiedBy`           VARCHAR(55) ,
 `billingID`            INT NOT NULL ,
 `bookingID`            INT NOT NULL ,

PRIMARY KEY (`billingDetailsID`),
KEY `fkIdx_214` (`billingID`),
CONSTRAINT `FK_214` FOREIGN KEY `fkIdx_214` (`billingID`) REFERENCES `Billing` (`billingID`),
KEY `fkIdx_223` (`bookingID`),
CONSTRAINT `FK_223` FOREIGN KEY `fkIdx_223` (`bookingID`) REFERENCES `Booking` (`bookingID`)
);






-- ************************************** `Pricing`

CREATE TABLE `Pricing`
(
 `pricingID`      INT NOT NULL ,
 `DateStarted`    DATE NOT NULL ,
 `dateEnd`        DATE NOT NULL ,
 `unitPrice`      FLOAT NOT NULL ,
 `minUnit`        INT NOT NULL ,
 `unit`           INT NOT NULL ,
 `status`         VARCHAR(55) NOT NULL ,
 `commision`      FLOAT NOT NULL ,
 `pricing_numID`  INT NOT NULL ,
 `dateCreated`    DATE NOT NULL ,
 `dateModified`   DATE ,
 `createdBy`      VARCHAR(55) NOT NULL ,
 `modifiedBy`     VARCHAR(55) ,
 `accomodationID` INT NOT NULL ,

PRIMARY KEY (`pricingID`),
KEY `fkIdx_172` (`accomodationID`),
CONSTRAINT `FK_172` FOREIGN KEY `fkIdx_172` (`accomodationID`) REFERENCES `Accomodation` (`accomodationID`)
);






-- ************************************** `AccomodationDetails`

CREATE TABLE `AccomodationDetails`
(
 `accomodationDetailsID`     INT NOT NULL ,
 `url`                       VARCHAR(55) ,
 `resourceType`              VARCHAR(55) NOT NULL ,
 `accomodationDetails_NumID` INT NOT NULL ,
 `accomodationID`            INT NOT NULL ,

PRIMARY KEY (`accomodationDetailsID`),
KEY `fkIdx_149` (`accomodationID`),
CONSTRAINT `FK_149` FOREIGN KEY `fkIdx_149` (`accomodationID`) REFERENCES `Accomodation` (`accomodationID`)
);






-- ************************************** `BookingDetails`

CREATE TABLE `BookingDetails`
(
 `bookingDetailsID`     INT NOT NULL ,
 `bokingdDetails_NumID` INT NOT NULL ,
 `startDate`            DATE NOT NULL ,
 `endDate`              DATE NOT NULL ,
 `startTime`            DATETIME NOT NULL ,
 `endTime`              DATETIME NOT NULL ,
 `peopleCount`          INT NOT NULL ,
 `status`               VARCHAR(55) NOT NULL ,
 `dateCreated`          DATE NOT NULL ,
 `dateModified`         DATE ,
 `datePending`          DATE NOT NULL ,
 `dateCancel`           DATE ,
 `dateConfirmed`        DATE NOT NULL ,
 `createdBy`            VARCHAR(55) NOT NULL ,
 `modifiedBy`           VARCHAR(55) ,
 `bookingID`            INT NOT NULL ,

PRIMARY KEY (`bookingDetailsID`),
KEY `fkIdx_185` (`bookingID`),
CONSTRAINT `FK_185` FOREIGN KEY `fkIdx_185` (`bookingID`) REFERENCES `Booking` (`bookingID`)
);






-- ************************************** `Reviews`

CREATE TABLE `Reviews`
(
 `reviewID`           INT NOT NULL ,
 `bookingID`          INT NOT NULL ,
 `userID`             INT NOT NULL ,
 `accomodationID`     INT NOT NULL ,
 `review_numID`       INT NOT NULL ,
 `rating`             INT NOT NULL ,
 `review_description` VARCHAR(55) ,
 `dateCreated`        DATE NOT NULL ,
 `dateModified`       DATE ,
 `createdBy`          VARCHAR(55) NOT NULL ,
 `modifiedBy`         VARCHAR(55) ,

PRIMARY KEY (`reviewID`, `bookingID`, `userID`, `accomodationID`),
KEY `fkIdx_91` (`bookingID`),
CONSTRAINT `FK_91` FOREIGN KEY `fkIdx_91` (`bookingID`) REFERENCES `Booking` (`bookingID`),
KEY `fkIdx_94` (`userID`),
CONSTRAINT `FK_94` FOREIGN KEY `fkIdx_94` (`userID`) REFERENCES `Users` (`userID`),
KEY `fkIdx_176` (`accomodationID`),
CONSTRAINT `FK_176` FOREIGN KEY `fkIdx_176` (`accomodationID`) REFERENCES `Accomodation` (`accomodationID`)
);






-- ************************************** `Logs`

CREATE TABLE `Logs`
(
 `logID`        NOT NULL ,
 `description` VARCHAR(75) NOT NULL ,
 `createdBy`   VARCHAR(55) NOT NULL ,
 `dateCreated` DATE NOT NULL ,
 `sessionID`   INT NOT NULL ,

PRIMARY KEY (`logID`),
KEY `fkIdx_53` (`sessionID`),
CONSTRAINT `FK_53` FOREIGN KEY `fkIdx_53` (`sessionID`) REFERENCES `Sessions` (`sessionID`)
);





