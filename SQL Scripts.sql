drop Database WholeyMoleyFoods;

Create Database WholeyMoleyFoods;
Go
Use WholeyMoleyFoods;
Go

Create Table Customer(
	customerID smallint PRIMARY KEY,
	cFirstName varchar(20),
	cLastName varchar(20),
	cStreet varchar(50),
	cCity varchar(20),
	cPostcode char(4),
	cDOB date,
	customerType varchar(40),
	creditStatus smallmoney,
	email varchar(320),
);

drop table customer;
select * from customer;


Create Table Employee(
	employeeID nVARCHAR(6) PRIMARY KEY,
	eFirstName varchar(20),
	eLastName varchar(20),
	eStreet varchar(50),
	eCity varchar(20),
	ePostcode char(4),
	contactPhoneNo varchar(20),
	emergContactNo varchar(20),
	eDOB date,
	dateofHire date,
	jobTitle varchar(10),
	reportTo nVARCHAR(6),
	currentPayRate decimal(4,2),
	onBoard Varchar(3),
);

drop table Employee;
select * from Employee;


CREATE TABLE Branch (
    branchID nVARCHAR(5) PRIMARY KEY,
    branchName VARCHAR(50),
    bStreet VARCHAR(50),
    bCity VARCHAR(20),
    bArea VARCHAR(20),
    bPostcode CHAR(4),
);
drop table Branch;
select * from Branch;



Create Table Item(
	itemID VARCHAR(10) primary key,
	itemDesc varchar(40),
	size int,
	subTo VARCHAR(10) NULL,
);
drop table Item;
select * from Item;


Create Table SkillSet(
	skillCode CHAR(2) primary key,
	skillDesc VARCHAR(30)
);

drop table SkillSet;
Select * from SkillSet;



Create Table Allergen(
	allergenCode CHAR(4) primary key,
	allergenDesc VARCHAR(30)
);
 drop table Allergen;
 select * from Allergen;



Create Table Account(
	accountID int Primary Key,
	accountName Varchar(50),
	balance smallmoney,
	lastPaymentDate date,
	typeOfPayment varchar(20),
	customerID smallint,
	foreign key (CustomerID) references Customer (CustomerID)
);
drop table account;
select * from account;



Create Table WorkingHour(
	employeeID nVARCHAR(6),
	workDate date,
	branchName VARCHAR(50),
	startTime time,
	finishTime time,
	primary key (EmployeeID, WorkDate),
	foreign key (EmployeeID) references Employee (EmployeeID)
);

drop table WorkingHour;
select * from WorkingHour;



Create Table EmployeeSkill(
	employeeID nVARCHAR(6),
	skillCode CHAR(2)
	primary key (EmployeeID, SkillCode),
	foreign key (EmployeeID) references Employee (EmployeeID),
	foreign key (SkillCode) references skillSet (SkillCode)
);

drop table EmployeeSkill;
Select * from EmployeeSkill;



Create Table ItemAllergen(
	itemID VARCHAR(10),
	allergenCode CHAR(4),
	primary key (ItemID, AllergenCode),
	foreign key (ItemID) references Item (ItemID),
	foreign key (AllergenCode) references Allergen (AllergenCode)
);

drop table ItemAllergen;
Select * from ItemAllergen;


CREATE TABLE EmployeeBaseBranch (
    employeeID nVARCHAR(6),
    branchID nVARCHAR(5),
    primary key (EmployeeID, BranchID),
	foreign key (EmployeeID) references Employee (EmployeeID),
	foreign key (BranchID) references Branch (BranchID)
);
drop table EmployeeBranch;
select * from EmployeeBranch;



Create Table BranchItem(
	branchID nVARCHAR(5), 
	itemID VARCHAR(10),
	onHandNum decimal(4,0),
	primary key (BranchID, ItemID),
	foreign key (BranchID) references Branch (BranchID),
	foreign key (ItemID) references Item (ItemID)
);
 drop table BranchItem;
 select * from BranchItem;
 select * from Item;




Create Table Orders(
	orderId smallint PRIMARY KEY,
	orderDate date,
	branchID nVARCHAR(5),
	pickUpDate date,
	pickUpBranchID nVARCHAR(5),
	creditAuthoStatus char(20),
	employeeID nVARCHAR(6),
	customerID smallint,
	foreign key (branchID) references branch (branchID),
	foreign key (EmployeeID) references Employee (EmployeeID),
	foreign key (CustomerID) references Customer (CustomerID)
);
 drop table orders;
 select * from orders;



Create Table OrderLine(
	orderID smallint,
	itemID VARCHAR(10),
	numOrdered DECIMAL(3,0),
	unitPrice DECIMAL(6,2),
	primary key (OrderID, ItemID),
	foreign key (OrderID) references Orders (OrderID),
	foreign key (ItemID) references Item (ItemID)
);
 drop table OrderLine;
 select * from OrderLine;
 select * from Item;


 
INSERT INTO Customer VALUES(1,'William','Smith','3330 Dignissim. Rd.','Timatu','7978','Oct 3, 1995','residentialAccount','$6,26','tempus@utlacus.edu');
INSERT INTO Customer VALUES(2,'Cally','Best','630-6131 Purus Street','Oamaru','9491','May 10, 1971','businessAccount','$18,37','callya@enim.com');
INSERT INTO Customer VALUES(3,'Magee','Fleming','P.O. Box 921, 1313 Purus. Av.','Hanan SHields','7910','Feb 1, 1981','residentialAccount','$22,57','tortor@cursus.ca');
INSERT INTO Customer VALUES(4,'Mohammad','Whitney','222-1335 Eget Avenue','Carlton','7204','Jun 15, 1977','cash','$31,35','congue.elit@scelerisqueneque.com');
INSERT INTO Customer VALUES(5,'Vladimir','Contreras','Ap #707-4003 Lacus. St.','Cabo de Hornos','9127','Mar 4, 1971','cash','$19,44','eget.volutpat.ornare@facilisisSuspendisse.edu');

select * from customer;


INSERT INTO Employee VALUES('Haw1','Leah','Hawkins','Ap #479-7041 Lobortis Av.','Rimouski','8907','869-2353','869-2352','20-OCT-1980','20-OCT-2019','Sales','Ben5','22.60','Yes');
INSERT INTO Employee VALUES('Buc2','Christen','Buchanan','Ap #878-5059 Et Road','Preston','9168','271-3480','271-3482','20-JAN-1986','2-OCT-2018','Sales','Ben5','20.21','Yes');
INSERT INTO Employee VALUES('Cal3','Halla','Calhoun','254-1806 Massa. Street','Heppignies','1629','847-0462','847-0461','20-MAY-1987','12-OCT-2019','Sales','Ben5','20.31','Yes');
INSERT INTO Employee VALUES('Ran4','Mallory','Randall','8138 Donec Ave','Borno','3593','995-1274','995-1276','3-JUN-1990','20-MAY-2020','Sales','Ben5','39.44','Yes');
INSERT INTO Employee VALUES('Ben5','Cherokee','Bender','Ap #306-6814 Blandit. Street','Moffat','5209','246-6945','246-6946','18-OCT-1983','10-JAN-2017','Manager','Null','76.89','Yes');


select * from employee;


INSERT INTO Branch VALUES('BRAN1','Branch One','976 Condimentum Street','Ashburton','Canterbury','8400');
INSERT INTO Branch VALUES('BRAN2','Branch Two','7898 Lacinia Rd.','Gore','Hanan Shields','7910');
INSERT INTO Branch VALUES('BRAN3','Branch Three','3787 Vel, Rd.','Lincoln','Oamaru','9491');
INSERT INTO Branch VALUES('WASH1','Washdyke Farmers Market.','P.O. Box 558, 5677 Ante. Rd.','Washdyke','Timaru','7978');
INSERT INTO Branch VALUES('SHOW1','Trade Show','P.O. Box 733, 3757 Nec Road','Cambridge','Timaru','7978');


INSERT INTO Item VALUES('UKT88','Pellentesque ultricies',505,'OAM46');
INSERT INTO Item VALUES('OAM46','Donec fringilla.',332, ' ');
INSERT INTO Item VALUES('ZEM63','neque pellentesque massa',117,'OAM46');
INSERT INTO Item VALUES('SIV64','pede. Cras',372,'OAM46');
INSERT INTO Item VALUES('YFG31','semper auctor.',932,' ');

select * from Item;


INSERT INTO skillSet VALUES('FL','Drive Forklift');
INSERT INTO skillSet VALUES('FA','First Aid Certificate');
INSERT INTO skillSet VALUES('MQ','Erect a Marquee');

select * from skillSet;


INSERT INTO Allergen VALUES('QZKD','sem. Nulla');
INSERT INTO Allergen VALUES('MHRG','vel quam');
INSERT INTO Allergen VALUES('OOEF','interdum. Nunc');

select * from Allergen;


INSERT INTO Account VALUES(1,'William Smith','$46,71','29-DEC-21','cash',1);
INSERT INTO Account VALUES(2,'Cally Best','$12,33','18-OCT-19','cheque,',2);
INSERT INTO Account VALUES(3,'Magee Fleming','$26,27','05-AUG-20','credit card',3);


select * from Account;


INSERT INTO WorkingHour VALUES('Haw1','17-NOV-19','BRAN2','08:00','13:15');
INSERT INTO WorkingHour VALUES('Buc2','07-NOV-19','BRAN2','08:00','12:00');
INSERT INTO WorkingHour VALUES('Cal3','05-NOV-19','BRAN2','08:00','13:00');
INSERT INTO WorkingHour VALUES('Ran4','06-NOV-19','BRAN2','08:00','14:00');
INSERT INTO WorkingHour VALUES('Ben5','04-NOV-19','BRAN2','09:00','14:00');


INSERT INTO EmployeeSkill VALUES('Haw1','FL');
INSERT INTO EmployeeSkill VALUES('Haw1','FA');
INSERT INTO EmployeeSkill VALUES('Buc2','FA');
INSERT INTO EmployeeSkill VALUES('Cal3','FA');
INSERT INTO EmployeeSkill VALUES('Ran4','MQ');
INSERT INTO EmployeeSkill VALUES('Ben5','FL');


INSERT INTO ItemAllergen VALUES('UKT88','QZKD');
INSERT INTO ItemAllergen VALUES('OAM46','MHRG');
INSERT INTO ItemAllergen VALUES('ZEM63','OOEF');


INSERT INTO EmployeeBaseBranch VALUES('Haw1','wash1');
INSERT INTO EmployeeBaseBranch VALUES('Buc2','wash1');
INSERT INTO EmployeeBaseBranch VALUES('Cal3','wash1');
INSERT INTO EmployeeBaseBranch VALUES('Ran4','wash1');
INSERT INTO EmployeeBaseBranch VALUES('Ben5','wash1');


INSERT INTO BranchItem([BranchID],[ItemID],[OnHandNum]) VALUES('WASH1','UKT88',100);
INSERT INTO BranchItem([BranchID],[ItemID],[OnHandNum]) VALUES('WASH1','OAM46',199);
INSERT INTO BranchItem([BranchID],[ItemID],[OnHandNum]) VALUES('WASH1','ZEM63',76);


INSERT INTO Orders VALUES(1,'Jul 15, 2020','WASH1','Aug 11, 2020','WASH1','Accepted','Haw1',1);
INSERT INTO Orders VALUES(2,'Jul 15, 2020','WASH1','Aug 2, 2020','WASH1','OnHold','Haw1',2);
INSERT INTO Orders VALUES(3,'Jul 3, 2020','WASH1','Aug 8, 2020','WASH1','Accepted','Haw1',3);


INSERT INTO OrderLine VALUES(1,'UKT88',67,879);
INSERT INTO OrderLine VALUES(2,'OAM46',72,936);
INSERT INTO OrderLine VALUES(3,'ZEM63',16,901);











