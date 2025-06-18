-- Drop and recreate the database
DROP DATABASE IF EXISTS eCommerceDB;
CREATE DATABASE eCommerceDB;
USE eCommerceDB;

-- Address table
CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    Street1 VARCHAR(255),
    Street2 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip VARCHAR(20)
);

-- Customer table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    ShippingAddress INT,
    BillingAddress INT,
    FOREIGN KEY (ShippingAddress) REFERENCES Address(AddressID),
    FOREIGN KEY (BillingAddress) REFERENCES Address(AddressID)
);

-- Order table
CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    OrderTotalAmount DECIMAL(10,2),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Product table
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10,2),
    Cost DECIMAL(10,2)
);

-- Order_Product join table
CREATE TABLE Order_Product (
    OrderID INT,
    ProductID INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Warehouse table
CREATE TABLE Warehouse (
    WarehouseID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Address INT,
    FOREIGN KEY (Address) REFERENCES Address(AddressID)
);

-- Inventory table (tracks stock by product and warehouse)
CREATE TABLE Inventory (
    ProductID INT,
    WarehouseID INT,
    Quantity INT,
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);
