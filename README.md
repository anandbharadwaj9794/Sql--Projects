# 🌾 AgriTrack – SQL Project  

## 📌 Project Overview  
**AgriTrack** is a SQL-based agricultural data management system designed to help **farmers and government authorities** manage farmland records, crop details, fertilizer usage, income & expenditure, market sales, and weather data.  
It generates insights on crop yield, profit, and market demand, enabling **data-driven farming and policy-making**.  

---

## 🚜 Features  
- 📜 Maintain **accurate farmer land records** (inspired by Meebhoomi).  
- 🌱 Track **crops grown per season** and their yield.  
- 🧪 Monitor **fertilizer usage, cost, and optimization**.  
- 💰 Record **income & expenditure** for profitability tracking.  
- ☔ Correlate **rainfall and weather patterns** with crop output.  
- 📈 Analyze **market demand vs supply** to guide crop planning.  

---

## 🗄️ Database Schema  

The project contains **8 main tables**:  
1. **Farmers** – Farmer details (ID, name, village, district, etc.)  
2. **Land_Details** – Survey numbers, area, ownership, soil type  
3. **Crop_Details** – Crops grown per season, sowing & harvest dates, yield  
4. **Fertilizer_Usage** – Fertilizers used, quantity, cost, and application dates  
5. **Income_Expenditure** – Income & expense records per farmer  
6. **Market_Sales** – Crops sold in markets with quantity and revenue  
7. **Weather_Data** – Rainfall and temperature data per location  
8. **Market_Demand_Prices** – Crop demand index and average prices  

---

## 📊 SQL Concepts Demonstrated  
- ✅ **Joins & Subqueries** → Farmer crop/land tracking  
- ✅ **Aggregations (SUM, AVG, COUNT)** → Fertilizer usage, income vs expenditure  
- ✅ **CTEs (WITH clause)** → Profit calculation per farmer  
- ✅ **Window Functions (RANK, ROW_NUMBER)** → Rank farmers by revenue  
- ✅ **Group By & Having** → Detect oversupply and financial risks  
- ✅ **Views** → Crop yield vs rainfall analysis  

---
