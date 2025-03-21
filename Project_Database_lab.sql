create database Garment_Shop_Managment_System
drop database Garment_Shop_Managment_System

--tbl_Permission has a foreign key Per_Role_ID referencing the Role_ID in tbl_Roles.
--tbl_login has a foreign key Login_Role_ID referencing the Role_ID in tbl_Roles.
--tbl_Sales has a foreign key Sale_Cus_ID referencing the User_ID in tbl_Users.


CREATE TABLE tbl_Roles (
    Role_ID VARCHAR(20) PRIMARY KEY,
    Role_Name VARCHAR(50) NOT NULL,
    Role_Desc VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Permission (
    Per_ID VARCHAR(20) PRIMARY KEY,
    Per_Role_ID VARCHAR(20) NOT NULL,
    Per_Module VARCHAR(50) NOT NULL,
    Per_Name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Per_Role_ID) REFERENCES tbl_Roles(Role_ID)
);

CREATE TABLE tbl_Users (
    User_ID VARCHAR(20) PRIMARY KEY,
    User_Name VARCHAR(50) NOT NULL,
    User_Mobile VARCHAR(20) NOT NULL,
    User_Email VARCHAR(50) NOT NULL,
    User_Address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_login (
    Login_ID VARCHAR(20) PRIMARY KEY,
    Login_Name VARCHAR(50) NOT NULL,
    Login_Role_ID VARCHAR(20) NOT NULL,
    User_Password VARCHAR(20) NOT NULL,
    FOREIGN KEY (Login_Role_ID) REFERENCES tbl_Roles(Role_ID)
);

CREATE TABLE tbl_Inventory (
    Inv_ID VARCHAR(20) PRIMARY KEY,
    Inv_Items VARCHAR(50) NOT NULL,
    Inv_Desc VARCHAR(50) NOT NULL,
    Inv_Type VARCHAR(50) NOT NULL,
    Inv_Number INT NOT NULL
);

CREATE TABLE tbl_Sales (
    Sale_ID VARCHAR(20) PRIMARY KEY,
    Sale_Cus_ID VARCHAR(20) NOT NULL,
    Sale_Amount MONEY NOT NULL,
    Sale_Type VARCHAR(50) NOT NULL,
    Sale_Date DATETIME NOT NULL,
    Sale_Desc VARCHAR(50) NOT NULL,
    FOREIGN KEY (Sale_Cus_ID) REFERENCES tbl_Users(User_ID)
);

CREATE TABLE tbl_Brands (
    Brand_ID VARCHAR(20) PRIMARY KEY,
    Brand_Com VARCHAR(50) NOT NULL,
    Brand_Name VARCHAR(50) NOT NULL,
    Brand_Desc VARCHAR(50) NOT NULL,
    Brand_Type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Stocks (
    Stock_ID VARCHAR(20) PRIMARY KEY,
    Stock_Type VARCHAR(50) NOT NULL,
    Stock_Desc VARCHAR(50) NOT NULL
);

-- Create the Log_Table
CREATE TABLE Log_Table (
    Log_ID INT IDENTITY(1,1) PRIMARY KEY,
    Log_Message NVARCHAR(255),
    Log_Date DATETIME DEFAULT GETDATE()
);


-- Insert data into tbl_Roles
INSERT INTO tbl_Roles (Role_ID, Role_Name, Role_Desc) VALUES
('R001', 'Admin', 'Administrator Role'),
('R002', 'Manager', 'Managerial Role'),
('R003', 'Salesperson', 'Sales Role'),
('R004', 'Cashier', 'Cashier Role'),
('R005', 'Customer', 'Customer Role'),
('R006', 'Supplier', 'Supplier Role'),
('R007', 'Support', 'Support Role'),
('R008', 'Analyst', 'Analyst Role'),
('R009', 'Developer', 'Developer Role'),
('R010', 'Tester', 'Tester Role'),
('R011', 'Designer', 'Designer Role'),
('R012', 'Engineer', 'Engineering Role'),
('R013', 'Consultant', 'Consulting Role'),
('R014', 'Technician', 'Technical Role'),
('R015', 'Marketing', 'Marketing Role'),
('R016', 'HR', 'Human Resources Role'),
('R017', 'Legal', 'Legal Role'),
('R018', 'Security', 'Security Role'),
('R019', 'Production', 'Production Role'),
('R020', 'Logistics', 'Logistics Role'),
('R021', 'Quality Assurance', 'Quality Assurance Role'),
('R022', 'Finance', 'Finance Role'),
('R023', 'IT', 'Information Technology Role'),
('R024', 'Operations', 'Operations Role'),
('R025', 'Training', 'Training Role'),
('R026', 'Sales Manager', 'Sales Manager Role'),
('R027', 'Inventory Manager', 'Inventory Manager Role'),
('R028', 'Purchasing', 'Purchasing Role'),
('R029', 'Customer Support', 'Customer Support Role'),
('R030', 'Research & Development', 'R&D Role');

-- Insert data into tbl_Permission
INSERT INTO tbl_Permission (Per_ID, Per_Role_ID, Per_Module, Per_Name) VALUES
('P001', 'R001', 'User Management', 'Add User'),
('P002', 'R001', 'User Management', 'Delete User'),
('P003', 'R002', 'Sales Management', 'View Sales Report'),
('P004', 'R003', 'Inventory Management', 'Update Inventory'),
('P005', 'R004', 'Sales Management', 'Process Sale'),
('P006', 'R005', 'Inventory Management', 'View Stock Status'),
('P007', 'R006', 'Supplier Management', 'Add Supplier'),
('P008', 'R006', 'Supplier Management', 'Edit Supplier'),
('P009', 'R007', 'Support Management', 'Customer Support'),
('P010', 'R008', 'Analytics', 'Data Analysis'),
('P011', 'R008', 'Analytics', 'Reporting'),
('P012', 'R009', 'Development', 'Coding'),
('P013', 'R009', 'Development', 'Testing'),
('P014', 'R010', 'Testing', 'Test Execution'),
('P015', 'R011', 'Design', 'UI/UX Design'),
('P016', 'R012', 'Engineering', 'System Design'),
('P017', 'R013', 'Consulting', 'Advisory Services'),
('P018', 'R014', 'Technical Support', 'Troubleshooting'),
('P019', 'R015', 'Marketing Campaigns', 'Campaign Creation'),
('P020', 'R015', 'Marketing Campaigns', 'Analysis'),
('P021', 'R016', 'Recruitment', 'Hiring Process'),
('P022', 'R016', 'Training', 'Employee Training'),
('P023', 'R017', 'Legal Compliance', 'Regulatory Compliance'),
('P024', 'R018', 'Security Monitoring', 'Surveillance'),
('P025', 'R019', 'Production Planning', 'Resource Allocation'),
('P026', 'R019', 'Production Planning', 'Quality Control'),
('P027', 'R020', 'Logistics Management', 'Supply Chain Management'),
('P028', 'R021', 'Quality Assurance', 'Quality Checks'),
('P029', 'R022', 'Financial Reporting', 'Financial Analysis'),
('P030', 'R023', 'IT Support', 'System Maintenance');

-- Insert data into tbl_Users
INSERT INTO tbl_Users (User_ID, User_Name, User_Mobile, User_Email, User_Address) VALUES
('U001', 'John Doe', '1234567890', 'john.doe@example.com', '123 Main St'),
('U002', 'Jane Smith', '2345678901', 'jane.smith@example.com', '456 Elm St'),
('U003', 'Michael Johnson', '3456789012', 'michael.johnson@example.com', '789 Oak St'),
('U004', 'Emily Davis', '4567890123', 'emily.davis@example.com', '012 Pine St'),
('U005', 'Christopher Wilson', '5678901234', 'chris.wilson@example.com', '345 Maple St'),
('U006', 'Ava Martinez', '6789012345', 'ava.martinez@example.com', '678 Cedar St'),
('U007', 'William Taylor', '7890123456', 'william.taylor@example.com', '901 Pine St'),
('U008', 'Olivia Thomas', '8901234567', 'olivia.thomas@example.com', '234 Elm St'),
('U009', 'David Clark', '9012345678', 'david.clark@example.com', '567 Oak St'),
('U010', 'Sophia Harris', '0123456789', 'sophia.harris@example.com', '890 Maple St'),
('U011', 'James Anderson', '0987654321', 'james.anderson@example.com', '901 Cedar St'),
('U012', 'Isabella Lee', '9876543210', 'isabella.lee@example.com', '123 Pine St'),
('U013', 'Benjamin White', '8765432109', 'benjamin.white@example.com', '456 Elm St'),
('U014', 'Emma Martinez', '7654321098', 'emma.martinez@example.com', '789 Oak St'),
('U015', 'Alexander Hall', '6543210987', 'alexander.hall@example.com', '012 Maple St'),
('U016', 'Mia King', '5432109876', 'mia.king@example.com', '345 Cedar St'),
('U017', 'Ethan Scott', '4321098765', 'ethan.scott@example.com', '678 Pine St'),
('U018', 'Charlotte Green', '3210987654', 'charlotte.green@example.com', '901 Elm St'),
('U019', 'Noah Adams', '2109876543', 'noah.adams@example.com', '234 Pine St'),
('U020', 'Amelia Baker', '1098765432', 'amelia.baker@example.com', '567 Oak St'),
('U021', 'Jacob Turner', '0987654321', 'jacob.turner@example.com', '890 Maple St'),
('U022', 'Sophia Harris', '9876543210', 'sophia.harris@example.com', '901 Cedar St'),
('U023', 'Liam Mitchell', '8765432109', 'liam.mitchell@example.com', '123 Elm St'),
('U024', 'Olivia James', '7654321098', 'olivia.james@example.com', '456 Pine St'),
('U025', 'Lucas Nelson', '6543210987', 'lucas.nelson@example.com', '789 Oak St'),
('U026', 'Isabella Allen', '5432109876', 'isabella.allen@example.com', '012 Maple St'),
('U027', 'Ethan Baker', '4321098765', 'ethan.baker@example.com', '345 Cedar St'),
('U028', 'Amelia Turner', '3210987654', 'amelia.turner@example.com', '678 Pine St'),
('U029', 'William Adams', '2109876543', 'william.adams@example.com', '901 Elm St'),
('U030', 'Ava Phillips', '1098765432', 'ava.phillips@example.com', '234 Pine St');

-- Insert data into tbl_login
INSERT INTO tbl_login (Login_ID, Login_Name, Login_Role_ID, User_Password) VALUES
('L001', 'john_doe', 'R001', 'password123'),
('L002', 'jane_smith', 'R002', 'securepass456'),
('L003', 'michael_johnson', 'R003', 'strongpwd789'),
('L004', 'emily_davis', 'R004', 'admin123'),
('L005', 'chris_wilson', 'R005', 'pass123'),
('L006', 'ava_martinez', 'R006', 'password456'),
('L007', 'william_taylor', 'R007', 'securepass789'),
('L008', 'olivia_thomas', 'R008', 'strongpwd123'),
('L009', 'david_clark', 'R009', 'admin456'),
('L010', 'sophia_harris', 'R010', 'pass456'),
('L011', 'james_anderson', 'R011', 'password789'),
('L012', 'isabella_lee', 'R012', 'securepass123'),
('L013', 'benjamin_white', 'R013', 'strongpwd456'),
('L014', 'emma_martinez', 'R014', 'admin789'),
('L015', 'alexander_hall', 'R015', 'pass789'),
('L016', 'mia_king', 'R016', 'password123'),
('L017', 'ethan_scott', 'R017', 'securepass456'),
('L018', 'charlotte_green', 'R018', 'strongpwd789'),
('L019', 'noah_adams', 'R019', 'admin123'),
('L020', 'amelia_baker', 'R020', 'pass123'),
('L021', 'jacob_turner', 'R021', 'password456'),
('L022', 'sophia_harris', 'R022', 'securepass789'),
('L023', 'liam_mitchell', 'R023', 'strongpwd123'),
('L024', 'olivia_james', 'R024', 'admin456'),
('L025', 'lucas_nelson', 'R025', 'pass456'),
('L026', 'isabella_allen', 'R026', 'password789'),
('L027', 'ethan_baker', 'R027', 'securepass123'),
('L028', 'amelia_turner', 'R028', 'strongpwd456'),
('L029', 'william_adams', 'R029', 'admin789'),
('L030', 'ava_phillips', 'R030', 'pass789');

-- Insert data into tbl_Inventory
INSERT INTO tbl_Inventory (Inv_ID, Inv_Items, Inv_Desc, Inv_Type, Inv_Number) VALUES
('I001', 'Shirts', 'Men Shirts', 'Clothing', 100),
('I002', 'Pants', 'Women Pants', 'Clothing', 120),
('I003', 'Dresses', 'Evening Dresses', 'Clothing', 80),
('I004', 'Suits', 'Men Suits', 'Clothing', 50),
('I005', 'Tops', 'Casual Tops', 'Clothing', 90),
('I006', 'Skirts', 'Women Skirts', 'Clothing', 70),
('I007', 'Jeans', 'Denim Jeans', 'Clothing', 110),
('I008', 'Jackets', 'Winter Jackets', 'Clothing', 60),
('I009', 'Coats', 'Men Coats', 'Clothing', 40),
('I010', 'Accessories', 'Fashion Accessories', 'Clothing', 150),
('I011', 'Sandals', 'Women Sandals', 'Footwear', 200),
('I012', 'Sneakers', 'Sports Sneakers', 'Footwear', 180),
('I013', 'Boots', 'Men Boots', 'Footwear', 120),
('I014', 'Heels', 'High Heels', 'Footwear', 100),
('I015', 'Flats', 'Casual Flats', 'Footwear', 150),
('I016', 'Slippers', 'House Slippers', 'Footwear', 80),
('I017', 'Hats', 'Fashion Hats', 'Accessories', 90),
('I018', 'Scarves', 'Winter Scarves', 'Accessories', 70),
('I019', 'Belts', 'Leather Belts', 'Accessories', 120),
('I020', 'Bags', 'Handbags', 'Accessories', 110),
('I021', 'Watches', 'Wrist Watches', 'Accessories', 130),
('I022', 'Glasses', 'Sunglasses', 'Accessories', 100),
('I023', 'Jewelry', 'Fashion Jewelry', 'Accessories', 140),
('I024', 'Perfumes', 'Fragrances', 'Beauty', 180),
('I025', 'Skincare', 'Skin Care Products', 'Beauty', 200),
('I026', 'Makeup', 'Cosmetics', 'Beauty', 150),
('I027', 'Haircare', 'Hair Care Products', 'Beauty', 160),
('I028', 'Bodycare', 'Body Lotions', 'Beauty', 120),
('I029', 'Nailcare', 'Nail Polishes', 'Beauty', 100),
('I030', 'Tools', 'Beauty Tools', 'Beauty', 80);

-- Insert data into tbl_Sales
INSERT INTO tbl_Sales (Sale_ID, Sale_Cus_ID, Sale_Amount, Sale_Type, Sale_Date, Sale_Desc) VALUES
('S001', 'U001', 500.00, 'In-Store', '2024-04-01 10:00:00', 'Sale to John Doe'),
('S002', 'U002', 700.00, 'Online', '2024-04-02 11:30:00', 'Sale to Jane Smith'),
('S003', 'U003', 900.00, 'In-Store', '2024-04-03 12:45:00', 'Sale to Michael Johnson'),
('S004', 'U004', 600.00, 'Online', '2024-04-04 14:15:00', 'Sale to Emily Davis'),
('S005', 'U005', 800.00, 'In-Store', '2024-04-05 15:30:00', 'Sale to Christopher Wilson'),
('S006', 'U006', 400.00, 'Online', '2024-04-06 16:45:00', 'Sale to Ava Martinez'),
('S007', 'U007', 300.00, 'In-Store', '2024-04-07 18:00:00', 'Sale to William Taylor'),
('S008', 'U008', 200.00, 'Online', '2024-04-08 19:15:00', 'Sale to Olivia Thomas'),
('S009', 'U009', 1000.00, 'In-Store', '2024-04-09 20:30:00', 'Sale to David Clark'),
('S010', 'U010', 1200.00, 'Online', '2024-04-10 21:45:00', 'Sale to Sophia Harris'),
('S011', 'U011', 1500.00, 'In-Store', '2024-04-11 23:00:00', 'Sale to James Anderson'),
('S012', 'U012', 800.00, 'Online', '2024-04-12 10:00:00', 'Sale to Isabella Lee'),
('S013', 'U013', 1000.00, 'In-Store', '2024-04-13 11:30:00', 'Sale to Benjamin White'),
('S014', 'U014', 600.00, 'Online', '2024-04-14 12:45:00', 'Sale to Emma Martinez'),
('S015', 'U015', 700.00, 'In-Store', '2024-04-15 14:15:00', 'Sale to Alexander Hall'),
('S016', 'U016', 800.00, 'Online', '2024-04-16 15:30:00', 'Sale to Mia King'),
('S017', 'U017', 900.00, 'In-Store', '2024-04-17 16:45:00', 'Sale to Ethan Scott'),
('S018', 'U018', 500.00, 'Online', '2024-04-18 18:00:00', 'Sale to Charlotte Green'),
('S019', 'U019', 700.00, 'In-Store', '2024-04-19 19:15:00', 'Sale to Noah Adams'),
('S020', 'U020', 800.00, 'Online', '2024-04-20 20:30:00', 'Sale to Amelia Baker'),
('S021', 'U021', 1000.00, 'In-Store', '2024-04-21 21:45:00', 'Sale to Jacob Turner'),
('S022', 'U022', 1200.00, 'Online', '2024-04-22 23:00:00', 'Sale to Sophia Harris'),
('S023', 'U023', 1500.00, 'In-Store', '2024-04-23 10:00:00', 'Sale to Liam Mitchell'),
('S024', 'U024', 800.00, 'Online', '2024-04-24 11:30:00', 'Sale to Olivia James'),
('S025', 'U025', 1000.00, 'In-Store', '2024-04-25 12:45:00', 'Sale to Lucas Nelson'),
('S026', 'U026', 1200.00, 'Online', '2024-04-26 14:15:00', 'Sale to Isabella Allen'),
('S027', 'U027', 1500.00, 'In-Store', '2024-04-27 15:30:00', 'Sale to Ethan Baker'),
('S028', 'U028', 800.00, 'Online', '2024-04-28 16:45:00', 'Sale to Amelia Turner'),
('S029', 'U029', 1000.00, 'In-Store', '2024-04-29 18:00:00', 'Sale to William Adams'),
('S030', 'U030', 1200.00, 'Online', '2024-04-30 19:15:00', 'Sale to Ava Phillips');

-- Insert data into tbl_Brands
INSERT INTO tbl_Brands (Brand_ID, Brand_Com, Brand_Name, Brand_Desc, Brand_Type) VALUES
('B001', 'Fashion Co.', 'Fashion Shirts', 'Men\ Shirts Collection', 'Clothing'),
('B002', 'Trendy Wear', 'Trendy Pants', 'Women Pants Collection', 'Clothing'),
('B003', 'Elegant Designs', 'Elegant Dresses', 'Evening Dresses Collection', 'Clothing'),
('B004', 'Classic Suits', 'Classic Suits', 'Men Suits Collection', 'Clothing'),
('B005', 'Casual Tops', 'Casual Tops', 'Casual Tops Collection', 'Clothing'),
('B006', 'Chic Skirts', 'Chic Skirts', 'Women Skirts Collection', 'Clothing'),
('B007', 'Denim Jeans', 'Denim Jeans', 'Denim Jeans Collection', 'Clothing'),
('B008', 'Winter Wardrobe', 'Winter Jackets', 'Winter Jackets Collection', 'Clothing'),
('B009', 'Men Essentials', 'Men Coats', 'Men Coats Collection', 'Clothing'),
('B010', 'Fashion Accessories', 'Fashion Accessories', 'Fashion Accessories Collection', 'Accessories'),
('B011', 'Stylish Sandals', 'Stylish Sandals', 'Women Sandals Collection', 'Footwear'),
('B012', 'Sports Sneakers', 'Sports Sneakers', 'Sports Sneakers Collection', 'Footwear'),
('B013', 'Tough Boots', 'Tough Boots', 'Men Boots Collection', 'Footwear'),
('B014', 'High Heels', 'High Heels', 'High Heels Collection', 'Footwear'),
('B015', 'Casual Flats', 'Casual Flats', 'Casual Flats Collection', 'Footwear'),
('B016', 'Comfortable Slippers', 'Comfortable Slippers', 'House Slippers Collection', 'Footwear'),
('B017', 'Stylish Hats', 'Stylish Hats', 'Fashion Hats Collection', 'Accessories'),
('B018', 'Winter Scarves', 'Winter Scarves', 'Winter Scarves Collection', 'Accessories'),
('B019', 'Leather Belts', 'Leather Belts', 'Leather Belts Collection', 'Accessories'),
('B020', 'Chic Handbags', 'Chic Handbags', 'Handbags Collection', 'Accessories'),
('B021', 'Wrist Watches', 'Wrist Watches', 'Wrist Watches Collection', 'Accessories'),
('B022', 'Fashionable Glasses', 'Fashionable Glasses', 'Sunglasses Collection', 'Accessories'),
('B023', 'Fashion Jewelry', 'Fashion Jewelry', 'Fashion Jewelry Collection', 'Accessories'),
('B024', 'Fragrance House', 'Fragrances', 'Fragrances Collection', 'Beauty'),
('B025', 'Skincare Essentials', 'Skin Care Products', 'Skin Care Products Collection', 'Beauty'),
('B026', 'Cosmetics Co.', 'Cosmetics', 'Cosmetics Collection', 'Beauty'),
('B027', 'Haircare Solutions', 'Hair Care Products', 'Hair Care Products Collection', 'Beauty'),
('B028', 'Bodycare Essentials', 'Body Lotions', 'Body Lotions Collection', 'Beauty'),
('B029', 'Nailcare Products', 'Nail Polishes', 'Nail Polishes Collection', 'Beauty'),
('B030', 'Beauty Tools', 'Beauty Tools', 'Beauty Tools Collection', 'Beauty');

-- Insert data into tbl_Stocks
INSERT INTO tbl_Stocks (Stock_ID, Stock_Type, Stock_Desc) VALUES
('ST01', 'Shirts', 'Men Shirts'),
('ST02', 'Pants', 'Women Pants'),
('ST03', 'Dresses', 'Evening Dresses'),
('ST04', 'Suits', 'Men Suits'),
('ST05', 'Tops', 'Casual Tops'),
('ST06', 'Skirts', 'Women Skirts'),
('ST07', 'Jeans', 'Denim Jeans'),
('ST08', 'Jackets', 'Winter Jackets'),
('ST09', 'Coats', 'Men Coats'),
('ST10', 'Accessories', 'Fashion Accessories'),
('ST11', 'Sandals', 'Women Sandals'),
('ST12', 'Sneakers', 'Sports Sneakers'),
('ST13', 'Boots', 'Men Boots'),
('ST14', 'Heels', 'High Heels'),
('ST15', 'Flats', 'Casual Flats'),
('ST16', 'Slippers', 'House Slippers'),
('ST17', 'Hats', 'Fashion Hats'),
('ST18', 'Scarves', 'Winter Scarves'),
('ST19', 'Belts', 'Leather Belts'),
('ST20', 'Bags', 'Handbags'),
('ST21', 'Watches', 'Wrist Watches'),
('ST22', 'Glasses', 'Sunglasses'),
('ST23', 'Jewelry', 'Fashion Jewelry'),
('ST24', 'Perfumes', 'Fragrances'),
('ST25', 'Skincare', 'Skin Care Products'),
('ST26', 'Makeup', 'Cosmetics'),
('ST27', 'Haircare', 'Hair Care Products'),
('ST28', 'Bodycare', 'Body Lotions'),
('ST29', 'Nailcare', 'Nail Polishes'),
('ST30', 'Tools', 'Beauty Tools');




SELECT * FROM tbl_Roles
SELECT * FROM tbl_Permission
SELECT * FROM tbl_Users
SELECT * FROM tbl_login
SELECT * FROM tbl_Inventory
SELECT * FROM tbl_Sales
SELECT * FROM tbl_Brands
SELECT * FROM tbl_Stocks
SELECT * FROM Log_Table



SELECT * FROM tbl_Roles inner join tbl_Permission on tbl_Roles.Role_Name=tbl_Permission.Per_Name
SELECT * FROM tbl_Roles  full outer join tbl_Permission on tbl_Roles.Role_Name=tbl_Permission.Per_Name




SELECT * FROM tbl_Roles  full outer join tbl_login on tbl_Roles.Role_Name=tbl_login.Login_Name

--View to shoe role data
CREATE VIEW RoleS AS
SELECT * FROM tbl_Roles

-- View to show roles and corresponding permissions without sensitive information
CREATE VIEW vw_Roles_Permissions AS
SELECT tbl_Roles.Role_ID, tbl_Roles.Role_Name, tbl_Roles.Role_Desc, tbl_Permission.Per_Module, tbl_Permission.Per_Name
FROM tbl_Roles
INNER JOIN tbl_Permission ON tbl_Roles.Role_ID = tbl_Permission.Per_Role_ID;

-- View to show user login details without sensitive information
CREATE VIEW vw_User_Logins AS
SELECT tbl_Users.User_ID, tbl_Users.User_Name, tbl_Users.User_Mobile, tbl_Users.User_Email, tbl_Users.User_Address, tbl_login.Login_Name
FROM tbl_Users
INNER JOIN tbl_login ON tbl_Users.User_ID = tbl_login.Login_ID;

-- View to show inventory details without sensitive information
CREATE VIEW  vw_Inventory AS
SELECT tbl_Inventory.Inv_ID, tbl_Inventory.Inv_Items, tbl_Inventory.Inv_Desc, tbl_Inventory.Inv_Type, tbl_Inventory.Inv_Number
FROM tbl_Inventory;

-- View to show sales details without sensitive information
CREATE VIEW vw_Sales AS
SELECT tbl_Sales.Sale_ID, tbl_Users.User_Name AS Customer_Name, tbl_Sales.Sale_Amount, tbl_Sales.Sale_Type, tbl_Sales.Sale_Date, tbl_Sales.Sale_Desc
FROM tbl_Sales
INNER JOIN tbl_Users ON tbl_Sales.Sale_Cus_ID = tbl_Users.User_ID;

-- View to show brand details without sensitive information
CREATE VIEW vw_Brands AS
SELECT tbl_Brands.Brand_ID, tbl_Brands.Brand_Com, tbl_Brands.Brand_Name, tbl_Brands.Brand_Desc, tbl_Brands.Brand_Type
FROM tbl_Brands;

-- View to show stock details without sensitive information
CREATE VIEW vw_Stocks AS
SELECT tbl_Stocks.Stock_ID, tbl_Stocks.Stock_Type, tbl_Stocks.Stock_Desc
FROM tbl_Stocks;




--CREATE THE TRIGGER IN TBL_SALES
CREATE TRIGGER Apply_Discount ON tbl_Sales
AFTER INSERT
AS
BEGIN
    UPDATE tbl_Sales
    SET Sale_Amount = Sale_Amount * 0.95
    WHERE Sale_ID IN (SELECT Sale_ID FROM inserted WHERE Sale_Amount > 1000);
END;

INSERT INTO tbl_Users (User_ID, User_Name, User_Mobile, User_Email, User_Address) VALUES
('U031', 'Anjum', '1234567890', 'anjum.@example.com', '123 LHR')
INSERT INTO tbl_Sales (Sale_ID, Sale_Cus_ID, Sale_Amount, Sale_Type, Sale_Date, Sale_Desc) VALUES
('S031', 'U031', 1100.00, 'In-Store', '2024-04-01 10:00:00', 'Sale to Anjum')



--CREATE THE TRIGGER IN TBL_ROLES
CREATE TRIGGER trg_Insert_Role
ON tbl_Roles
AFTER INSERT
AS
BEGIN
    INSERT INTO Log_Table (Log_Message)
    VALUES ('New role inserted');
END;




INSERT INTO tbl_Roles (Role_ID, Role_Name, Role_Desc) VALUES
('R031', 'Customer', 'Customer Role')



--CREATE THE TRIGGER IN TBL_PERMISSION
CREATE TRIGGER trg_Update_Permission
ON tbl_Permission
AFTER UPDATE
AS
BEGIN
    UPDATE Log_Table
    SET Log_Message = 'Permission updated'
    WHERE Log_ID IN (SELECT Log_ID FROM inserted);
END;

-- Update a row in tbl_Permission
UPDATE tbl_Permission
SET Per_Name = 'New Permission Name'
WHERE Per_ID = 'P001'; 




--CREATE THE TRIGGER IN TBL_USERS
CREATE TRIGGER trg_Delete_User
ON tbl_Users
AFTER DELETE
AS
BEGIN
    INSERT INTO Log_Table (Log_Message, Log_Date)
    VALUES ('User deleted', GETDATE());
END;

-- Delete a user from tbl_Users
DELETE FROM tbl_Sales
WHERE Sale_Cus_ID = 'U031';

SELECT * FROM [RoleS]

