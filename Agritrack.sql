Create Database Agritrack;

Use  Agritrack;

-

-- Table 1 Farmers Personal Information
CREATE TABLE Farmers (
  Farmer_ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(150) NOT NULL,
  Age TINYINT,
  Contact VARCHAR(20),
  Village VARCHAR(100),
  Mandal VARCHAR(100),
  District VARCHAR(100),
  State VARCHAR(50)
);

-- Table 2 Land_Details (Table Structure Taken from Meebhoomi-Govrnment Website)
CREATE TABLE Land_Details (
  Land_ID INT AUTO_INCREMENT PRIMARY KEY,
  Farmer_ID INT,
  Survey_No VARCHAR(50) NOT NULL,
  Sub_Division_No VARCHAR(20),
  Village VARCHAR(100),
  Mandal VARCHAR(100),
  District VARCHAR(100),
  Area_Acres DECIMAL(8,3),
  Land_Type VARCHAR(20),
  Soil_Type VARCHAR(50),
  Irrigation_Type VARCHAR(50),
  Ownership_Type VARCHAR(50),
  UNIQUE KEY uq_parcel (Survey_No, Sub_Division_No, Village, Mandal, District),
  FOREIGN KEY (Farmer_ID) REFERENCES Farmers(Farmer_ID)
);

-- Table 3 Crop_Details
CREATE TABLE Crop_Details (
  Crop_ID INT AUTO_INCREMENT PRIMARY KEY,
  Land_ID INT,
  Farmer_ID INT,
  Crop_Name VARCHAR(80) NOT NULL,
  Season VARCHAR(20),
  Sowing_Date DATE,
  Harvest_Date DATE,
  Yield_Quantity DECIMAL(12,2),
  FOREIGN KEY (Land_ID) REFERENCES Land_Details(Land_ID),
  FOREIGN KEY (Farmer_ID) REFERENCES Farmers(Farmer_ID)
);

-- Table 4 Fertilizer_Usage
CREATE TABLE Fertilizer_Usage (
  Fertilizer_ID INT AUTO_INCREMENT PRIMARY KEY,
  Crop_ID INT,
  Farmer_ID INT,
  Fertilizer_Name VARCHAR(100),
  Quantity DECIMAL(10,3),
  Application_Date DATE,
  Cost DECIMAL(12,2),
  FOREIGN KEY (Crop_ID) REFERENCES Crop_Details(Crop_ID),
  FOREIGN KEY (Farmer_ID) REFERENCES Farmers(Farmer_ID)
);

-- Table 5 Income_Expenditure
CREATE TABLE Income_Expenditure (
  Record_ID INT AUTO_INCREMENT PRIMARY KEY,
  Farmer_ID INT,
  Type ENUM('Income','Expenditure') NOT NULL,
  Description VARCHAR(255),
  Amount DECIMAL(14,2) NOT NULL,
  Date DATE,
  FOREIGN KEY (Farmer_ID) REFERENCES Farmers(Farmer_ID)
);

-- Table 6 Market_Sales
CREATE TABLE Market_Sales (
  Sale_ID INT AUTO_INCREMENT PRIMARY KEY,
  Farmer_ID INT,
  Crop_ID INT,
  Market_Name VARCHAR(150),
  Sale_Date DATE,
  Quantity_Sold DECIMAL(14,2),
  Price_Per_Unit DECIMAL(12,2),
  Total_Sale_Amount DECIMAL(18,2),
  FOREIGN KEY (Farmer_ID) REFERENCES Farmers(Farmer_ID),
  FOREIGN KEY (Crop_ID) REFERENCES Crop_Details(Crop_ID)
);

-- Table 7 Weather_Data
CREATE TABLE Weather_Data (
  Weather_ID INT AUTO_INCREMENT PRIMARY KEY,
  Location VARCHAR(150) NOT NULL,
  Season VARCHAR(20),
  Rainfall DECIMAL(8,2),
  Temperature DECIMAL(6,2),
  Year SMALLINT,
  Month TINYINT
);

-- Table 8 Market_Demand_Prices
CREATE TABLE Market_Demand_Prices (
  Demand_ID INT AUTO_INCREMENT PRIMARY KEY,
  Crop_Name VARCHAR(80) NOT NULL,
  Location VARCHAR(150) NOT NULL,
  Year SMALLINT,
  Month TINYINT,
  Demand_Index DECIMAL(7,2),
  Avg_Price_Per_Unit DECIMAL(12,2),
  Quantity_Demanded DECIMAL(14,2)
);
USE agritrack;

-- 1) Farmers 
INSERT INTO Farmers (Name, Age, Contact, Village, Mandal, District, State) VALUES
('Ramesh', 45, '9876543210', 'Kurnool Rural', 'Kurnool', 'Kurnool', 'AP'),
('Suresh', 38, '8765432109', 'Warangal Urban', 'Warangal', 'Warangal', 'TS'),
('Mahesh', 50, '7654321098', 'Guntur East', 'Guntur', 'Guntur', 'AP'),
('Kiran', 42, '9988776655', 'Nellore South', 'Nellore', 'Nellore', 'AP'),
('Rajesh', 36, '8877665544', 'Karimnagar West', 'Karimnagar', 'Karimnagar', 'TS'),
('Venkat', 55, '7766554433', 'Prakasam North', 'Prakasam', 'Prakasam', 'AP'),
('Arun', 40, '6655443322', 'Adilabad Rural', 'Adilabad', 'Adilabad', 'TS'),
('Naresh', 47, '5544332211', 'Vizag Rural', 'Visakhapatnam', 'Visakhapatnam', 'AP'),
('Ravi', 35, '4433221100', 'Khammam Urban', 'Khammam', 'Khammam', 'TS'),
('Balu', 60, '3322110099', 'Chittoor Central', 'Chittoor', 'Chittoor', 'AP');

-- 2) Land_Details 
INSERT INTO Land_Details (Farmer_ID, Survey_No, Sub_Division_No, Village, Mandal, District, Area_Acres, Land_Type, Soil_Type, Irrigation_Type, Ownership_Type) VALUES
(1, '45/2', 'A', 'Kurnool Rural', 'Kurnool', 'Kurnool', 7.5, 'Dry', 'Red Soil', 'Canal', 'Patta'),
(2, '112/3', 'B', 'Warangal Urban', 'Warangal', 'Warangal', 5.0, 'Wet', 'Black Soil', 'Borewell', 'Patta'),
(3, '89/1', 'C', 'Guntur East', 'Guntur', 'Guntur', 10.0, 'Wet', 'Alluvial', 'Rainfed', 'Joint'),
(4, '67/5', 'D', 'Nellore South', 'Nellore', 'Nellore', 8.2, 'Dry', 'Sandy', 'Canal', 'Patta'),
(5, '23/4', 'A', 'Karimnagar West', 'Karimnagar', 'Karimnagar', 6.5, 'Wet', 'Black Soil', 'Borewell', 'Patta'),
(6, '56/2', 'E', 'Prakasam North', 'Prakasam', 'Prakasam', 12.0, 'Dry', 'Red Soil', 'Rainfed', 'Patta'),
(7, '78/1', 'F', 'Adilabad Rural', 'Adilabad', 'Adilabad', 9.0, 'Wet', 'Clay', 'Canal', 'Joint'),
(8, '90/6', 'G', 'Vizag Rural', 'Visakhapatnam', 'Visakhapatnam', 11.0, 'Dry', 'Laterite', 'Rainfed', 'Patta'),
(9, '34/3', 'H', 'Khammam Urban', 'Khammam', 'Khammam', 7.8, 'Wet', 'Alluvial', 'Borewell', 'Patta'),
(10, '12/8', 'I', 'Chittoor Central', 'Chittoor', 'Chittoor', 6.0, 'Dry', 'Red Soil', 'Rainfed', 'Patta');

-- 3) Crop_Details 
INSERT INTO Crop_Details (Land_ID, Farmer_ID, Crop_Name, Season, Sowing_Date, Harvest_Date, Yield_Quantity) VALUES
(1, 1, 'Wheat', 'Rabi', '2024-11-15', '2025-03-10', 3500),
(2, 2, 'Rice', 'Kharif', '2024-06-20', '2024-10-15', 5000),
(3, 3, 'Cotton', 'Kharif', '2024-06-10', '2024-11-20', 4200),
(4, 4, 'Maize', 'Rabi', '2024-12-01', '2025-04-01', 3800),
(5, 5, 'Pulses', 'Rabi', '2024-11-10', '2025-03-01', 2000),
(6, 6, 'Groundnut', 'Kharif', '2024-07-05', '2024-11-01', 2500),
(7, 7, 'Sugarcane', 'Annual', '2024-01-10', '2025-01-15', 15000),
(8, 8, 'Millets', 'Kharif', '2024-06-25', '2024-10-30', 1800),
(9, 9, 'Chillies', 'Rabi', '2024-12-15', '2025-04-10', 2200),
(10, 10, 'Tomato', 'Kharif', '2024-07-01', '2024-10-20', 3000);

-- 4) Fertilizer_Usage 
INSERT INTO Fertilizer_Usage (Crop_ID, Farmer_ID, Fertilizer_Name, Quantity, Application_Date, Cost) VALUES
(1, 1, 'Urea', 120, '2024-12-05', 2500),
(2, 2, 'DAP', 150, '2024-07-15', 3500),
(3, 3, 'Potash', 100, '2024-08-10', 2000),
(4, 4, 'Super Phosphate', 90, '2024-12-20', 1800),
(5, 5, 'Organic Manure', 200, '2024-11-15', 1000),
(6, 6, 'Urea', 80, '2024-07-25', 1600),
(7, 7, 'Compost', 300, '2024-03-01', 1200),
(8, 8, 'NPK', 70, '2024-07-30', 2100),
(9, 9, 'DAP', 60, '2024-12-25', 1400),
(10, 10, 'Potash', 50, '2024-07-10', 1000);

-- 5) Income_Expenditure 
INSERT INTO Income_Expenditure (Farmer_ID, Type, Description, Amount, Date) VALUES
(1, 'Income', 'Wheat Sale', 120000, '2025-03-15'),
(1, 'Expenditure', 'Fertilizers', 2500, '2024-12-05'),
(2, 'Income', 'Rice Sale', 180000, '2024-10-20'),
(2, 'Expenditure', 'Labor Wages', 8000, '2024-09-15'),
(3, 'Income', 'Cotton Sale', 200000, '2024-11-25'),
(4, 'Income', 'Maize Sale', 95000, '2025-04-05'),
(5, 'Income', 'Pulses Sale', 60000, '2025-03-10'),
(6, 'Expenditure', 'Seeds', 5000, '2024-07-01'),
(7, 'Income', 'Sugarcane Sale', 500000, '2025-01-20'),
(8, 'Expenditure', 'Irrigation', 3000, '2024-08-05');

-- 6) Market_Sales 
INSERT INTO Market_Sales (Farmer_ID, Crop_ID, Market_Name, Sale_Date, Quantity_Sold, Price_Per_Unit, Total_Sale_Amount) VALUES
(1, 1, 'Kurnool Mandi', '2025-03-20', 3000, 40, 120000),
(2, 2, 'Warangal Market', '2024-10-25', 4800, 38, 182400),
(3, 3, 'Guntur Yard', '2024-11-25', 4000, 50, 200000),
(4, 4, 'Nellore Yard', '2025-04-10', 3500, 28, 98000),
(5, 5, 'Karimnagar Mandi', '2025-03-15', 1800, 33, 59400),
(6, 6, 'Prakasam Yard', '2024-11-10', 2400, 35, 84000),
(7, 7, 'Adilabad Market', '2025-01-25', 14000, 35, 490000),
(8, 8, 'Vizag Yard', '2024-10-28', 1700, 32, 54400),
(9, 9, 'Khammam Market', '2025-04-15', 2000, 45, 90000),
(10, 10, 'Chittoor Market', '2024-10-25', 2800, 30, 84000);

-- 7) Weather_Data 
INSERT INTO Weather_Data (Location, Season, Rainfall, Temperature, Year, Month) VALUES
('Kurnool Rural', 'Rabi', 120.5, 26.4, 2024, 3),
('Warangal Urban', 'Kharif', 220.0, 29.5, 2024, 8),
('Guntur East', 'Kharif', 180.3, 28.0, 2024, 9),
('Nellore South', 'Rabi', 140.2, 25.0, 2024, 12),
('Karimnagar West', 'Rabi', 100.5, 24.5, 2025, 1),
('Prakasam North', 'Kharif', 200.8, 30.2, 2024, 7),
('Adilabad Rural', 'Annual', 300.0, 27.5, 2024, 5),
('Vizag Rural', 'Kharif', 250.0, 29.0, 2024, 8),
('Khammam Urban', 'Rabi', 110.0, 23.5, 2025, 2),
('Chittoor Central', 'Kharif', 190.0, 28.0, 2024, 9);

-- 8) Market_Demand_Prices 
INSERT INTO Market_Demand_Prices (Crop_Name, Location, Year, Month, Demand_Index, Avg_Price_Per_Unit, Quantity_Demanded) VALUES
('Wheat', 'Kurnool Mandi', 2025, 3, 95, 38, 2800),
('Rice', 'Warangal Market', 2024, 10, 110, 38, 5000),
('Cotton', 'Guntur Yard', 2024, 11, 120, 50, 4200),
('Maize', 'Nellore Yard', 2025, 4, 88, 27, 3400),
('Pulses', 'Karimnagar Mandi', 2025, 3, 92, 34, 2000),
('Groundnut', 'Prakasam Yard', 2024, 11, 105, 36, 2600),
('Sugarcane', 'Adilabad Market', 2025, 1, 115, 37, 14000),
('Millets', 'Vizag Yard', 2024, 10, 85, 31, 1500),
('Chillies', 'Khammam Market', 2025, 4, 98, 44, 2100),
('Tomato', 'Chittoor Market', 2024, 10, 90, 28, 2500);

Select * from farmers;

-- Q1. Show all land parcels larger than 8 acres.

SELECT Farmer_ID,Survey_No, Village, Area_Acres
FROM Land_Details
WHERE Area_Acres > 8;

-- Q2. Get farmer names along with crops they grew

SELECT f.Name, c.Crop_Name, c.Season 
FROM Farmers f
JOIN Crop_Details c ON f.Farmer_ID = c.Farmer_ID;

-- Q3. Find farmers who earned more than the average income.

SELECT ie.Farmer_ID, f.Name, ie.Amount
FROM Income_Expenditure ie
JOIN Farmers f ON ie.Farmer_ID = f.Farmer_ID
WHERE ie.Type = 'Income'
  AND ie.Amount > (
        SELECT AVG(Amount) 
        FROM Income_Expenditure 
        WHERE Type = 'Income'
      );

-- Q4. Rank farmers based on their total sales amount.

SELECT 
    ms.Farmer_ID, 
    f.Name,
    SUM(ms.Total_Sale_Amount) AS Revenue,
    RANK() OVER (ORDER BY SUM(ms.Total_Sale_Amount) DESC) AS Rank_Pos
FROM Market_Sales ms
JOIN Farmers f ON ms.Farmer_ID = f.Farmer_ID
GROUP BY ms.Farmer_ID, f.Name;


-- Q5.calculate profit (Income – Expenditure) for each farmer.

WITH Profit_CTE AS (
  SELECT 
      ie.Farmer_ID,
      SUM(CASE WHEN ie.Type='Income' THEN ie.Amount ELSE 0 END) -
      SUM(CASE WHEN ie.Type='Expenditure' THEN ie.Amount ELSE 0 END) AS Profit
  FROM Income_Expenditure ie
  GROUP BY ie.Farmer_ID
)
SELECT 
    p.Farmer_ID,
    f.Name,
    f.Village,
    f.Mandal,
    f.District,
    f.State,
    p.Profit
FROM Profit_CTE p
JOIN Farmers f ON p.Farmer_ID = f.Farmer_ID
ORDER BY p.Profit DESC;
 
-- Q6 Track total fertilizer usage per farmer

SELECT 
    f.Farmer_ID,
    f.Name,
    fu.Fertilizer_Name,
    SUM(fu.Quantity) AS Total_Quantity,
    SUM(fu.Cost) AS Total_Cost
FROM Fertilizer_Usage fu
JOIN Farmers f ON fu.Farmer_ID = f.Farmer_ID
GROUP BY f.Farmer_ID, f.Name, fu.Fertilizer_Name
ORDER BY Total_Quantity DESC;

-- Q7.Fertilizer usage per crop

SELECT 
    f.Name AS Farmer_Name,
    c.Crop_Name,
    fu.Fertilizer_Name,
    SUM(fu.Quantity) AS Total_Quantity,
    SUM(fu.Cost) AS Total_Cost
FROM Fertilizer_Usage fu
JOIN Crop_Details c ON fu.Crop_ID = c.Crop_ID
JOIN Farmers f ON fu.Farmer_ID = f.Farmer_ID
GROUP BY f.Name, c.Crop_Name, fu.Fertilizer_Name
ORDER BY c.Crop_Name, Total_Quantity DESC;

-- Q8. Track average rainfall per Mandal

SELECT 
    l.Mandal,
    AVG(w.Rainfall) AS Avg_Rainfall_mm,
    AVG(w.Temperature) AS Avg_Temp_C
FROM Land_Details l
JOIN Weather_Data w ON l.Village = w.Location
GROUP BY l.Mandal
ORDER BY Avg_Rainfall_mm DESC;


-- Q9.Farmer-wise crop areas vs rainfall

SELECT 
    f.Farmer_ID,
    f.Name,
    c.Crop_Name,
    SUM(l.Area_Acres) AS Total_Area,
    AVG(w.Rainfall) AS Avg_Rainfall_mm
FROM Farmers f
JOIN Land_Details l ON f.Farmer_ID = l.Farmer_ID
JOIN Crop_Details c ON l.Land_ID = c.Land_ID
JOIN Weather_Data w ON l.Village = w.Location
GROUP BY f.Farmer_ID, f.Name, c.Crop_Name
ORDER BY Avg_Rainfall_mm DESC, Total_Area DESC;

-- Q10.Crop yield vs rainfall trend

SELECT 
    c.Crop_Name,
    SUM(c.Yield_Quantity) AS Total_Yield,
    AVG(w.Rainfall) AS Avg_Rainfall_mm
FROM Crop_Details c
JOIN Land_Details l ON c.Land_ID = l.Land_ID
JOIN Weather_Data w ON l.Village = w.Location
GROUP BY c.Crop_Name
ORDER BY Total_Yield DESC;

-- Q11.Low-demand crops in a market 

SELECT Crop_Name, Location, Year, Month, Demand_Index
FROM Market_Demand_Prices
WHERE Demand_Index < 100
ORDER BY Demand_Index ASC;


-- Q12.Total land area per Mandal growing Rice

SELECT l.Mandal, SUM(l.Area_Acres) AS Total_Area_Rice
FROM Land_Details l
JOIN Crop_Details c ON l.Land_ID = c.Land_ID
WHERE c.Crop_Name = 'Rice'
GROUP BY l.Mandal
ORDER BY Total_Area_Rice DESC;

