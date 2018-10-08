CREATE TABLE Users
(
  userID VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  prefferedName VARCHAR(50) NOT NULL,
  registrationType VARCHAR(20) NOT NULL,
  age INT NOT NULL,
  address1 VARCHAR(100) NOT NULL,
  address2 VARCHAR(100) NOT NULL,
  town VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  userType VARCHAR(20) NOT NULL,
  homePhone INT NOT NULL,
  mobilePhone INT NOT NULL,
  dateModified DATE NOT NULL,
  createdBy VARCHAR(50) NOT NULL,
  modifiedBy VARCHAR(50) NOT NULL,
  nationality VARCHAR(50) NOT NULL,
  nic VARCHAR(50) NOT NULL,
  PRIMARY KEY (userID)
);

CREATE TABLE Sessions
(
  sessionID INT NOT NULL,
  loginTimestamp INT NOT NULL,
  logoutTimestamp INT NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified DATE NOT NULL,
  createdBy VARCHAR(50) NOT NULL,
  modifiedBy VARCHAR(50) NOT NULL,
  userID VARCHAR(50) NOT NULL,
  PRIMARY KEY (sessionID),
  FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Logs
(
  logID INT NOT NULL,
  description VARCHAR(75) NOT NULL,
  createdBy VARCHAR(50) NOT NULL,
  dateCreated DATE NOT NULL,
  sessionID INT NOT NULL,
  PRIMARY KEY (logID),
  FOREIGN KEY (sessionID) REFERENCES Sessions(sessionID)
);

CREATE TABLE Accomodation
(
  accomodationID INT NOT NULL,
  type VARCHAR(50) NOT NULL,
  shortDescription VARCHAR(50) NOT NULL,
  longDescription VARCHAR(50) NOT NULL,
  address1 VARCHAR(50) NOT NULL,
  address2 VARCHAR(50) NOT NULL,
  town VARCHAR(50) NOT NULL,
  lattitude VARCHAR(20) NOT NULL,
  longitude VARCHAR(20) NOT NULL,
  agreement_acceptation VARCHAR(50) NOT NULL,
  agreement_acceptation_date DATE NOT NULL,
  features VARCHAR(50) NOT NULL,
  capacity VARCHAR(30) NOT NULL,
  date_created DATE NOT NULL,
  date_modified DATE NOT NULL,
  createdBy VARCHAR(50) NOT NULL,
  modifiedBy VARCHAR(50) NOT NULL,
  accomodation_numID INT NOT NULL,
  userID VARCHAR(50) NOT NULL,
  PRIMARY KEY (accomodationID),
  FOREIGN KEY (userID) REFERENCES Users(userID),
  UNIQUE (accomodation_numID)
);

CREATE TABLE Accomodation_Details
(
  accomodationDetailsID INT NOT NULL,
  url VARCHAR(100) NOT NULL,
  resourceType VARCHAR(20) NOT NULL,
  accomodationDetails_numID INT NOT NULL,
  accomodationID INT NOT NULL,
  PRIMARY KEY (accomodationDetailsID),
  FOREIGN KEY (accomodationID) REFERENCES Accomodation(accomodationID),
  UNIQUE (accomodationDetails_numID)
);

CREATE TABLE Booking
(
  bookingID INT NOT NULL,
  itemsCounts INT NOT NULL,
  status INT NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified INT NOT NULL,
  createdBy VARCHAR(50) NOT NULL,
  modifiedBy DATE NOT NULL,
  booking_numID INT NOT NULL,
  userID VARCHAR(50) NOT NULL,
  PRIMARY KEY (bookingID),
  FOREIGN KEY (userID) REFERENCES Users(userID),
  UNIQUE (booking_numID)
);

CREATE TABLE booking_Details
(
  bookingDetailsID INT NOT NULL,
  bokingdDetails_NumID INT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  startTime DATE NOT NULL,
  endTime DATE NOT NULL,
  peopleCount INT NOT NULL,
  status VARCHAR(50) NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified DATE NOT NULL,
  datePending DATE NOT NULL,
  dateCancel DATE NOT NULL,
  createdBy VARCHAR(50) NOT NULL,
  modifiedBy VARCHAR(50) NOT NULL,
  dateConfirmed DATE NOT NULL,
  bookingID INT NOT NULL,
  accomodationID INT NOT NULL,
  PRIMARY KEY (bookingDetailsID),
  FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
  FOREIGN KEY (accomodationID) REFERENCES Accomodation(accomodationID),
  UNIQUE (bokingdDetails_NumID)
);

CREATE TABLE Reviews
(
  reviewID INT NOT NULL,
  review_numID INT NOT NULL,
  rating INT NOT NULL,
  review_description VARCHAR(55) NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified DATE NOT NULL,
  createdBy VARCHAR(55) NOT NULL,
  modifiedBy VARCHAR(55) NOT NULL,
  accomodationID INT NOT NULL,
  bookingID INT NOT NULL,
  userID VARCHAR(50) NOT NULL,
  PRIMARY KEY (reviewID),
  FOREIGN KEY (accomodationID) REFERENCES Accomodation(accomodationID),
  FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
  FOREIGN KEY (userID) REFERENCES Users(userID),
  UNIQUE (review_numID)
);

CREATE TABLE Pricing
(
  pricingID INT NOT NULL,
  DateStarted DATE NOT NULL,
  dateEnd DATE NOT NULL,
  unitPrice FLOAT NOT NULL,
  minUnit INT NOT NULL,
  unit INT NOT NULL,
  status VARCHAR(55) NOT NULL,
  commision FLOAT NOT NULL,
  pricing_numID INT NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified DATE NOT NULL,
  createdBy VARCHAR(55) NOT NULL,
  modifiedBy VARCHAR(55) NOT NULL,
  accomodationID INT NOT NULL,
  PRIMARY KEY (pricingID),
  FOREIGN KEY (accomodationID) REFERENCES Accomodation(accomodationID),
  UNIQUE (pricing_numID)
);

CREATE TABLE Billing
(
  billingID INT NOT NULL,
  bill_numID INT NOT NULL,
  totalVatExcl FLOAT NOT NULL,
  totalVatIncl FLOAT NOT NULL,
  discountAmount FLOAT NOT NULL,
  totalVat FLOAT NOT NULL,
  discountCode INT NOT NULL,
  amountPaid FLOAT NOT NULL,
  amountReturned FLOAT NOT NULL,
  dateCreated DATE NOT NULL,
  status VARCHAR(55) NOT NULL,
  dateModified DATE NOT NULL,
  createdBy VARCHAR(55) NOT NULL,
  modifiedBy VARCHAR(55) NOT NULL,
  userID VARCHAR(50) NOT NULL,
  PRIMARY KEY (billingID),
  FOREIGN KEY (userID) REFERENCES Users(userID),
  UNIQUE (bill_numID)
);

CREATE TABLE Billing_Details
(
  billingDetailsID INT NOT NULL,
  cost DATE NOT NULL,
  status VARCHAR(55) NOT NULL,
  billingDetails_numID INT NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified DATE NOT NULL,
  createdBy VARCHAR(55) NOT NULL,
  modifiedBy VARCHAR(55) NOT NULL,
  billingID INT NOT NULL,
  bookingID INT NOT NULL,
  PRIMARY KEY (billingDetailsID),
  FOREIGN KEY (billingID) REFERENCES Billing(billingID),
  FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
  UNIQUE (billingDetails_numID)
);

CREATE TABLE Expense
(
  expenseID INT NOT NULL,
  customer VARCHAR(55) NOT NULL,
  details_description VARCHAR(75) NOT NULL,
  brn_vatNumber INT NOT NULL,
  Status VARCHAR(55) NOT NULL,
  paymentMethod VARCHAR(55) NOT NULL,
  validatedBy VARCHAR(55) NOT NULL,
  dateValidation DATE NOT NULL,
  createdBy VARCHAR(55) NOT NULL,
  modifiedBy VARCHAR(55) NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified DATE NOT NULL,
  userID VARCHAR(50) NOT NULL,
  PRIMARY KEY (expenseID),
  FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Expenses_Detail
(
  expensesDetails_numId INT NOT NULL,
  amountVatExcl FLOAT NOT NULL,
  amountVatIncl FLOAT NOT NULL,
  description VARCHAR(55) NOT NULL,
  paymentMethod VARCHAR(55) NOT NULL,
  validatedBy VARCHAR(55) NOT NULL,
  dateValidated DATE NOT NULL,
  createdBy VARCHAR(55) NOT NULL,
  modifiedBy VARCHAR(55) NOT NULL,
  dateCreated DATE NOT NULL,
  dateModified DATE NOT NULL,
  expenseDetailsID INT NOT NULL,
  expenseID INT NOT NULL,
  PRIMARY KEY (expenseDetailsID),
  FOREIGN KEY (expenseID) REFERENCES Expense(expenseID),
  UNIQUE (expensesDetails_numId)
);