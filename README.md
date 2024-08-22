**Ecommerce Database Design**
  This project involves designing and implementing a database for an e-commerce platform. The database handles customer information, orders, payments, and shipments.

**Key Features**
  **(1) Normalization:** The database is normalized to reduce redundancy and ensure efficient storage.
  **(2) Entity-Relationship Diagram (ERD):** An ERD was created to visualize the structure, showing entities, attributes, and their relationships.
  **(3) Relational Schema:** The relational schema defines the tables, columns, data types, and relationships in the database.

**Database Structure**
The database includes the following tables:
  **(1) CUSTOMER:** Stores customer details.
  **(2) ADDRESS:** Manages customer addresses.
  **(3) CREDIT_LINE:** Tracks credit lines for customers.
  **(4) PRODUCT:** Contains product details.
  **(5) ORDERS:** Records customer orders.
  **(6) PAYMENT:** Manages payments.
  **(7) PAYMENT_METHOD:** Stores payment method details.
  **(8) SHIPMENT:** Tracks shipment information.
  
**Setup**
  To set up the database, run the following SQL script:
  
    **DROP DATABASE IF EXISTS Ecommerce_DB;
    CREATE DATABASE Ecommerce_DB;
    USE Ecommerce_DB;**
    -- CUSTOMER table
CREATE TABLE CUSTOMER (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNo VARCHAR(15) NOT NULL,
    HashedPassword VARCHAR(60) NOT NULL,
    EmailAddress VARCHAR(250) NOT NULL UNIQUE,
    MemberStatus ENUM('REGULAR', 'SILVER', 'GOLD', 'PLATINUM') NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
-- ADDRESS table
CREATE TABLE ADDRESS (
    AddressId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT NOT NULL,
    Address1 VARCHAR(250) NOT NULL,
    Address2 VARCHAR(250),
    City VARCHAR(250) NOT NULL,
    State VARCHAR(250),
    Country VARCHAR(250) NOT NULL,
    Zipcode VARCHAR(250) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(id)
);
-- CREDIT_LINE table
CREATE TABLE CREDIT_LINE (
    CustomerId INT NOT NULL,
    CustomerName VARCHAR(101) NOT NULL, 
    PRIMARY KEY (CustomerId),
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(id)
);
-- PRODUCT table
CREATE TABLE PRODUCT (
    ProductId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    ProductDescription VARCHAR(500) NOT NULL,
    ProductType ENUM('Desktop', 'Laptop', 'Printer', 'Accessory') NOT NULL,
    Price DOUBLE NOT NULL
);
-- ORDERS table
CREATE TABLE ORDERS (
    OrderId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT NOT NULL,
    ProductId INT NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES PRODUCT(ProductId),
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(id),
    DateOrdered TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
-- PAYMENT table
CREATE TABLE PAYMENT (
    PaymentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT NOT NULL,
    OrderId INT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(id),
    FOREIGN KEY (OrderId) REFERENCES ORDERS(OrderId),
    Amount DOUBLE NOT NULL
);
-- PAYMENT_METHOD table
CREATE TABLE PAYMENT_METHOD (
    PaymentMethodId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PaymentId INT NOT NULL,
    FOREIGN KEY (PaymentId) REFERENCES PAYMENT(PaymentId),
    CardType VARCHAR(60) NOT NULL,
    CardOwner VARCHAR(255) NOT NULL,
    ExpYear INT NOT NULL,
    ExpMonth INT NOT NULL,
    CONSTRAINT CheckExpMonth CHECK (ExpMonth BETWEEN 1 AND 12),
    CONSTRAINT CheckExpYear CHECK (ExpYear >= YEAR(CURDATE())),
    CardNo VARCHAR(20) NOT NULL,
    SecurityNo INT NOT NULL,
    BillingAddress VARCHAR(500) NOT NULL
);
-- SHIPMENT table
CREATE TABLE SHIPMENT (
    ShipmentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderId INT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES ORDERS(OrderId),
    CustomerName VARCHAR(255) NOT NULL,
    ShipmentAddress VARCHAR(500) NOT NULL,
    OrderStatus VARCHAR(60) NOT NULL,
    OrderLocation VARCHAR(255) NOT NULL,
    OrderShipped TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    OrderDelivered TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);_
    
**Conclusion**
This project demonstrates a database design for an e-commerce platform, with a focus on data integrity and efficient operation.

<img width="963" alt="Screenshot 2024-08-22 at 5 16 11 PM" src="https://github.com/user-attachments/assets/73ec9c0f-2991-47f9-8596-c2df1eb36f93">
<img width="904" alt="Screenshot 2024-08-22 at 5 16 28 PM" src="https://github.com/user-attachments/assets/3b5cda6c-3e8b-48a5-90ca-6883721892fa">
<img width="559" alt="Screenshot 2024-08-22 at 5 15 36 PM" src="https://github.com/user-attachments/assets/b54e6202-b437-4f2a-9ec2-4a9a7155488f">
