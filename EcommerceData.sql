USE Ecommerce_DB;

CALL InsertCustomer('CUST001','John','Doe','555-1234','hashedpassword123','john.doe@example.com','GOLD');
CALL InsertCustomer('CUST002','Jane','Smith','555-5678','hashedpassword456','jane.smith@example.com','SILVER');

CALL InsertAddresses('ADDR001','CUST001','123 Main St','Apt 4B','New York','NY','USA','10001');
CALL InsertAddresses('ADDR002','CUST002','456 Elm St','','Los Angeles','CA','USA','90001');

CALL InsertCreditLine('CUST001','John Doe');
CALL InsertCreditLine('CUST002','Jane Smith');

CALL InsertProduct('PROD001','Dell XPS 15','High-end laptop','Laptop',1500.00);
CALL InsertProduct('PROD002','HP LaserJet','Fast printer','Printer',300.00);

CALL InsertOrder('ORD001','CUST001','PROD001');
CALL InsertOrder('ORD002','CUST002','PROD002');

CALL InsertPayment('PAY001','CUST001','ORD001',1500.00);
CALL InsertPayment('PAY002','CUST002','ORD002',300.00);

CALL InsertPaymentMethod('PM001','PAY001','Visa','John Doe',2027,12,'4111111111111111',123,'123 Main St, NY');
CALL InsertPaymentMethod('PM002','PAY002','MasterCard','Jane Smith',2026,10,'5555555555554444',456,'456 Elm St, CA');

CALL InsertShipment('SHIP001','ORD001','John Doe','123 Main St, NY','Shipped','New York Warehouse');
CALL InsertShipment('SHIP002','ORD002','Jane Smith','456 Elm St, CA','Processing','Los Angeles Warehouse');
