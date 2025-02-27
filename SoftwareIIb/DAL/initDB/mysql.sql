﻿CREATE DATABASE IF NOT EXISTS SchedulingSoftware;
USE SchedulingSoftware;

CREATE TABLE country (
    countryId INT(10) NOT NULL AUTO_INCREMENT,
    country VARCHAR(50) NOT NULL,
    createDate DATETIME NOT NULL,
    createdBy VARCHAR(40) NOT NULL,
    lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastUpdateBy VARCHAR(40) NOT NULL,
    PRIMARY KEY (countryId)
);

CREATE TABLE city (
    cityId INT(10) NOT NULL AUTO_INCREMENT,
    city VARCHAR(50) NOT NULL,
    countryId INT(10) NOT NULL,
    createDate DATETIME NOT NULL,
    createdBy VARCHAR(40) NOT NULL,
    lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastUpdateBy VARCHAR(40) NOT NULL,
    PRIMARY KEY (cityId),
    FOREIGN KEY (countryId) REFERENCES country(countryId)
);

CREATE TABLE address (
    addressId INT(10) NOT NULL AUTO_INCREMENT,
    address VARCHAR(50) NOT NULL,
    address2 VARCHAR(50) NOT NULL,
    cityId INT(10) NOT NULL,
    postalCode VARCHAR(10) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    createDate DATETIME NOT NULL,
    createdBy VARCHAR(40) NOT NULL,
    lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastUpdateBy VARCHAR(40) NOT NULL,
    PRIMARY KEY (addressId),
    FOREIGN KEY (cityId) REFERENCES city(cityId)
);

CREATE TABLE user (
    userId INT NOT NULL AUTO_INCREMENT,
    userName VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    active TINYINT(1) NOT NULL,
    createDate DATETIME NOT NULL,
    createdBy VARCHAR(40) NOT NULL,
    lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastUpdateBy VARCHAR(40) NOT NULL,
    PRIMARY KEY (userId)
);

CREATE TABLE customer (
    customerId INT(10) NOT NULL AUTO_INCREMENT,
    customerName VARCHAR(45) NOT NULL,
    addressId INT(10) NOT NULL,
    active TINYINT(1) NOT NULL,
    createDate DATETIME NOT NULL,
    createdBy VARCHAR(40) NOT NULL,
    lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastUpdateBy VARCHAR(40) NOT NULL,
    PRIMARY KEY (customerId),
    FOREIGN KEY (addressId) REFERENCES address(addressId)
);

CREATE TABLE appointment (
    appointmentId INT(10) NOT NULL AUTO_INCREMENT,
    customerId INT(10) NOT NULL,
    userId INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location TEXT NOT NULL,
    contact TEXT NOT NULL,
    type TEXT NOT NULL,
    url VARCHAR(255),
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    createDate DATETIME NOT NULL,
    createdBy VARCHAR(40) NOT NULL,
    lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastUpdateBy VARCHAR(40) NOT NULL,
    PRIMARY KEY (appointmentId),
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (userId) REFERENCES user(userId)
);
