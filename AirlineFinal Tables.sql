CREATE DATABASE AirlineFinal

USE AirlineFinal

CREATE TABLE UserInfo
(
	UserID int identity(1,1) primary key,
	FirstName varchar(100) not null,
	LastName varchar(150) not null,
	Suffix varchar(10) null, 
	Birthdate varchar(10) not null, 
	Email varchar(255) not null unique, 
	PhoneNum varchar(12) not null, 
	AddressLine1 varchar(255) not null, 
	AddressLine2 varchar(255) null,
	City varchar(100) not null, 
	ZipCode varchar(5) not null,
	Username varchar(100) not null unique, 
	UserPassword varchar(100) not null
)

CREATE TABLE Airport
(
	AirportID int identity(1,1) primary key,
	Airport varchar(150) not null unique,
	City varchar(100) not null, 
	StateOrProvince varchar(100) not null, 
	Country varchar(100)
)

CREATE TABLE FlightType
(
	FlightTypeID int identity(1,1) primary key,
	Type varchar(50) unique
)

CREATE TABLE FlightInfo
(
	FlightID int identity(1,1) primary key,
	FlightNumber varchar(255) not null unique,
	DepartingAirport int foreign key references Airport(AirportID),
	DepartingTime datetime not null, 
	DestinationAirport int foreign key references Airport(AirportID),
	ArrivalTime datetime not null, 
	FlightTypeID int foreign key references FlightType(FlightTypeID) not null,
	price money not null
)

CREATE TABLE Booking
(
	BookingID int identity(1,1) primary key,
	FlightTypeID int foreign key references FlightType(FlightTypeID) not null,
	DepartureFlightID int foreign key references FlightInfo(FlightID) not null,
	ArrivalFlightID int foreign key references FlightInfo(FlightID) null,
	NumOfAdults int not null default(1),
	NumOfChildren int null default(0),
	UserID int foreign key references UserInfo(UserID)
)

CREATE TABLE ContactReason
(
	ContactReasonID int identity(1,1) primary key,
	Description varchar(255) not null unique
)

CREATE TABLE Contact
(
	ContactID int identity(1,1) primary key,
	ReasonForContacting int foreign key references ContactReason(ContactReasonID),
<<<<<<< HEAD
=======
	FlightID int foreign key references FlightInfo(FlightID),
>>>>>>> Jensine
	FirstName varchar(100) not null,
	LastName varchar(150) not null,
	PhoneNum varchar(12) not null, 
	Email varchar(255) not null, 
	PerferredMethodOfContact bit not null, 
	FurtherDescription text not null
)