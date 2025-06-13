
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    order_total DECIMAL(10, 2),
    order_status VARCHAR(20)
);


INSERT INTO orders (order_date, order_total, order_status) VALUES
('2024-01-15', 150.00, 'Completed'),
('2024-01-20', 200.00, 'Completed'),
('2024-02-05', 300.00, 'Cancelled'),
('2024-02-10', 250.00, 'Completed'),
('2024-03-01', 400.00, 'Completed');

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,         -- Extracts year-month from order_date
    SUM(order_total) AS total_sales,                   -- Total sales amount for the month
    COUNT(order_id) AS total_orders                    -- Number of orders placed
FROM orders
WHERE order_status = 'Completed'                       -- Optional: filter for completed orders only
GROUP BY DATE_FORMAT(order_date, '%Y-%m')              -- Group by month
ORDER BY month ASC;                                    -- Sort by month
