-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-10 22:03:21.312

-- tables
-- Table: Customer
CREATE TABLE Customer (
    CustId int  NOT NULL,
    CustName varchar(100)  NOT NULL,
    CustAddress varchar(200)  NOT NULL,
    CustPass varchar(100)  NOT NULL,
    CustMob varchar(100)  NOT NULL,
    CustEmail varchar(200)  NOT NULL,
    User_UserId varchar(100)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (CustId)
);

-- Table: Login
CREATE TABLE Login (
    LoginId varchar(100)  NOT NULL,
    LoginRoleId int  NOT NULL,
    LoginUserName varchar(200)  NOT NULL,
    UserPassword varchar(100)  NOT NULL,
    CONSTRAINT Login_pk PRIMARY KEY (LoginId)
);

-- Table: Password
CREATE TABLE Password (
    PassID int  NOT NULL,
    PassUserId varchar(100)  NOT NULL,
    PassDesc varchar(200)  NOT NULL,
    PassType varchar(100)  NOT NULL,
    PassTitle varchar(100)  NOT NULL,
    Customer_CustId int  NOT NULL,
    CONSTRAINT Password_pk PRIMARY KEY (PassID)
);

-- Table: Permission
CREATE TABLE Permission (
    PermissionId int  NOT NULL,
    PermissionRoleId varchar(100)  NOT NULL,
    PermissionModule varchar(200)  NOT NULL,
    PremissionName varchar(200)  NOT NULL,
    Password_PassID int  NOT NULL,
    CONSTRAINT Permission_pk PRIMARY KEY (PermissionId)
);

-- Table: Report
CREATE TABLE Report (
    ReportId int  NOT NULL,
    ReportType varchar(100)  NOT NULL,
    ReportDesc varchar(200)  NOT NULL,
    Customer_CustId int  NOT NULL,
    CONSTRAINT Report_pk PRIMARY KEY (ReportId)
);

-- Table: Role
CREATE TABLE Role (
    RoleId int  NOT NULL,
    RoleName varchar(100)  NOT NULL,
    RoleDesc varchar(200)  NOT NULL,
    CONSTRAINT Role_pk PRIMARY KEY (RoleId)
);

-- Table: User
CREATE TABLE User (
    UserId varchar(100)  NOT NULL,
    UserName varchar(200)  NOT NULL,
    UserMobile varchar(200)  NOT NULL,
    UserEmail varchar(200)  NOT NULL,
    UserAddress varchar(200)  NOT NULL,
    CONSTRAINT UserId PRIMARY KEY (UserId)
);

-- Table: UserCode
CREATE TABLE UserCode (
    UC_ID int  NOT NULL,
    UC_Type varchar(100)  NOT NULL,
    UC_UserId int  NOT NULL,
    UC_Name varchar(100)  NOT NULL,
    UC_Desc varchar(200)  NOT NULL,
    Customer_CustId int  NOT NULL,
    CONSTRAINT UserCode_pk PRIMARY KEY (UC_ID)
);

-- foreign keys
-- Reference: Customer_User (table: Customer)
ALTER TABLE Customer ADD CONSTRAINT Customer_User FOREIGN KEY Customer_User (User_UserId)
    REFERENCES User (UserId);

-- Reference: Login_User (table: Login)
ALTER TABLE Login ADD CONSTRAINT Login_User FOREIGN KEY Login_User (LoginUserName)
    REFERENCES User (UserName);

-- Reference: Password_Customer (table: Password)
ALTER TABLE Password ADD CONSTRAINT Password_Customer FOREIGN KEY Password_Customer (Customer_CustId)
    REFERENCES Customer (CustId);

-- Reference: Permission_Password (table: Permission)
ALTER TABLE Permission ADD CONSTRAINT Permission_Password FOREIGN KEY Permission_Password (Password_PassID)
    REFERENCES Password (PassID);

-- Reference: Report_Customer (table: Report)
ALTER TABLE Report ADD CONSTRAINT Report_Customer FOREIGN KEY Report_Customer (Customer_CustId)
    REFERENCES Customer (CustId);

-- Reference: Role_Login (table: Role)
ALTER TABLE Role ADD CONSTRAINT Role_Login FOREIGN KEY Role_Login (RoleId)
    REFERENCES Login (LoginRoleId);

-- Reference: UserCode_Customer (table: UserCode)
ALTER TABLE UserCode ADD CONSTRAINT UserCode_Customer FOREIGN KEY UserCode_Customer (Customer_CustId)
    REFERENCES Customer (CustId);

-- End of file.

