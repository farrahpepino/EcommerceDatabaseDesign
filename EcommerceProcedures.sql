USE Ecommerce_DB;

DELIMITER //
CREATE PROCEDURE InsertCustomer(
	IN p_Id VARCHAR(50),
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_PhoneNo VARCHAR(15),
    IN p_HashedPassword VARCHAR(60),
    IN p_EmailAddress VARCHAR(250),
    IN p_MemberStatus ENUM('REGULAR','SILVER','GOLD','PLATINUM') 
)
BEGIN
    INSERT INTO CUSTOMER (Id, FirstName, LastName, PhoneNo, HashedPassword, EmailAddress, MemberStatus)
    VALUES (p_Id, p_FirstName, p_LastName, p_PhoneNo, p_HashedPassword, p_EmailAddress, p_MemberStatus);
END // 

DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertAddresses(
IN p_AddressId VARCHAR(50),
IN p_CustomerId VARCHAR(50),
IN p_Address1 VARCHAR(250),
IN p_Address2 VARCHAR(250),
IN p_City VARCHAR(250),
IN p_State VARCHAR(250),
IN p_Country VARCHAR(250),
IN p_Zipcode VARCHAR(250)
)
BEGIN
	INSERT INTO ADDRESS (AddressId, CustomerId, Address1, Address2, City, State, Country, Zipcode) 
	VALUES (p_AddressId, p_CustomerId, p_Address1, p_Address2, p_City, p_State, p_Country, p_Zipcode);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertCreditLine(
IN p_CustomerId VARCHAR(50), IN p_CustomerName VARCHAR(101)
)
BEGIN
	INSERT INTO CREDIT_LINE (CustomerId, CustomerName) VALUES (p_CustomerId, p_CustomerName);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertProduct (IN p_ProductId VARCHAR(50), IN p_ProductName VARCHAR(255), IN p_ProductDescription VARCHAR(500), IN p_ProductType ENUM('Desktop','Laptop','Printer','Accessory'), IN p_Price DOUBLE
)
BEGIN
	INSERT INTO PRODUCT (ProductId, ProductName, ProductDescription, ProductType, Price) VALUES (p_ProductId, p_ProductName, p_ProductDescription, p_ProductType, p_Price);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertOrder (
IN p_OrderId VARCHAR(50), IN p_CustomerId VARCHAR(50), IN p_ProductId VARCHAR(50)
)
BEGIN 
	INSERT INTO ORDERS (OrderId, CustomerId, ProductId) VALUES (p_OrderId, p_CustomerId, p_ProductId);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertPayment(
IN p_PaymentId VARCHAR(50), IN p_CustomerId VARCHAR(50), IN p_OrderId VARCHAR(50), IN p_Amount DOUBLE
)
BEGIN
	INSERT INTO PAYMENT (PaymentId, CustomerId, OrderId, Amount) VALUES (p_PaymentId, p_CustomerId, p_OrderId, p_Amount);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertPaymentMethod(
IN p_PaymentMethodId VARCHAR(50), IN p_PaymentId VARCHAR(50), IN p_CardType VARCHAR(60), IN p_CardOwner VARCHAR(255), IN p_ExpYear INT, IN p_ExpMonth INT, IN p_CardNo VARCHAR(20), IN p_SecurityNo INT, IN p_BillingAddress VARCHAR(500)
)
BEGIN 
	INSERT INTO PAYMENT_METHOD (PaymentMethodId, PaymentId, CardType, CardOwner, ExpYear, ExpMonth, CardNo, SecurityNo, BillingAddress)
    VALUES (p_PaymentMethodId, p_PaymentId, p_CardType, p_CardOwner, p_ExpYear, p_ExpMonth, p_CardNo, p_SecurityNo, p_BillingAddress);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertShipment(
    IN p_ShipmentId VARCHAR(50),
    IN p_OrderId VARCHAR(50),
    IN p_CustomerName VARCHAR(255),
    IN p_ShipmentAddress VARCHAR(500),
    IN p_OrderStatus VARCHAR(60),
    IN p_OrderLocation VARCHAR(255)
)
BEGIN 
    INSERT INTO SHIPMENT (ShipmentId, OrderId, CustomerName, ShipmentAddress, OrderStatus, OrderLocation)
    VALUES (p_ShipmentId, p_OrderId, p_CustomerName, p_ShipmentAddress, p_OrderStatus, p_OrderLocation);
END //
DELIMITER ;


