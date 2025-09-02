USE Ecommerce_DB;

SELECT * 
FROM CUSTOMER c
JOIN ADDRESS a ON c.Id = a.CustomerId;

SELECT * 
FROM CUSTOMER c
JOIN CREDIT_LINE cl ON c.Id = cl.CustomerId;

SELECT * 
FROM ORDERS o
JOIN CUSTOMER c ON o.CustomerId = c.Id
JOIN PRODUCT p ON o.ProductId = p.ProductId;

SELECT * 
FROM PAYMENT pay
JOIN ORDERS o ON pay.OrderId = o.OrderId
JOIN CUSTOMER c ON o.CustomerId = c.Id;

SELECT * 
FROM PAYMENT_METHOD pm
JOIN PAYMENT pay ON pm.PaymentId = pay.PaymentId;

SELECT * 
FROM SHIPMENT s
JOIN ORDERS o ON s.OrderId = o.OrderId
JOIN CUSTOMER c ON o.CustomerId = c.Id;
