# AtliQ Mart Promotions Effectiveness Analysis

## Overview
This project involves analyzing the effectiveness of promotions run during Diwali 2023 and Sankranti 2024 on AtliQ branded products. The analysis aims to provide insights into the impact of these promotions on sales and to inform future promotional strategies.

## Table of Contents
- [Overview](#overview)
- [Project Description](#project-description)
- [Data](#data)
- [Methodology](#methodology)
- [Analysis and Findings](#analysis-and-findings)
- [Recommendations](#recommendations)
- [Ad Hoc Requests](#ad-hoc-requests)
- [Files and Resources](#files-and-resources)
- [Conclusion](#conclusion)
- [Contact Information](#contact-information)

## Project Description
### Background
AtliQ Mart, a retail giant with over 50 supermarkets in the southern region of India, ran promotions during Diwali 2023 and Sankranti 2024. The sales director, Bruce Haryali, requires insights to make informed decisions for future promotions.

### Objective
The objective is to analyze sales data before, during, and after the promotions to determine their effectiveness and provide actionable recommendations for future promotional activities.

## Data
### Data Source
The data was provided by AtliQ Mart and includes sales transactions from all stores during the specified periods.

### Data Description
The dataset includes transaction details such as product ID, category, sales amount, date of purchase, and promotion details.

## Methodology
### Approach
- Data Cleaning and Preparation
- Exploratory Data Analysis (EDA)
- Comparative Sales Analysis
- Statistical Analysis to Determine Effectiveness

### Tools and Technologies
- Power BI for data visualization
- MySQL for ad hoc requests

## Analysis and Findings
### Insights
#### Store Performance Analysis
- **Top 10 Stores by Incremental Revenue (IR):** Identified the top 10 stores that generated the highest incremental revenue from the promotions.
- **Bottom 10 Stores by Incremental Sold Units (ISU):** Identified the bottom 10 stores in terms of incremental sold units during the promotional period.
- **City-wise Store Performance:** Analyzed the performance of stores by city to identify common characteristics among top-performing stores that could be leveraged across other stores.

#### Promotion Type Analysis
- **Top 2 Promotion Types by Incremental Revenue:** Determined the promotion types that resulted in the highest incremental revenue.
- **Bottom 2 Promotion Types by Incremental Sold Units:** Identified the promotion types with the least impact on incremental sold units.
- **Discount vs. BOGOF/Cashback Promotions:** Compared the performance of discount-based promotions with BOGOF (Buy One Get One Free) and cashback promotions.
- **Best Balance Between ISU and Margins:** Identified promotions that strike the best balance between incremental sold units and maintaining healthy margins.

#### Product and Category Analysis
- **Significant Sales Lift by Category:** Determined which product categories saw the most significant lift in sales from the promotions.
- **Product-Specific Performance:** Identified specific products that responded exceptionally well or poorly to promotions.
- **Category and Promotion Type Correlation:** Analyzed the correlation between product category and promotion type effect.

### Recommendations
#### Focus on Effective Promotions
- Implement `₹500 Cashback` for Combo1 products.
- Use `BOGOF` promotions for Grocery & Staples, Home Appliances, and Home Care.

#### Re-evaluate Ineffective Promotions
- Discontinue or modify `25% OFF`, `33% OFF`, and `50% OFF` promotions, especially for Grocery & Staples and Personal Care categories.

#### Leverage High-Performing Products
- Continue promoting top-performing items in Home Appliances (e.g., AtliQ Waterproof Immersion Rod) and Home Care (e.g., AtliQ Double Bedsheet Set).

#### Address Poorly Performing Products
- Adjust promotional strategies for low-performing products in Grocery & Staples and Personal Care.
- Explore non-discount-based promotions for Personal Care.

## Ad Hoc Requests
### Store Performance Analysis
1. **High-Value Products in BOGOF Promotions:** List of products with a base price greater than 500 and featured in 'BOGOF' promotions to identify high-value products that are heavily discounted.
2. **Store Count by City:** Report on the number of stores in each city, sorted in descending order of store counts, to identify cities with the highest store presence.

### Campaign Analysis
3. **Revenue Before and After Campaigns:** Report displaying each campaign along with the total revenue generated before and after the campaign, helping evaluate the financial impact of the promotional campaigns.

### Category Analysis
4. **Incremental Sold Quantity (ISU%) During Diwali Campaign:** Report calculating the ISU% for each category during the Diwali campaign, with rankings based on ISU%, to assess the category-wise success and impact on incremental sales.

### Product Analysis
5. **Top 5 Products by Incremental Revenue Percentage (IR%):** Report featuring the top 5 products, ranked by IR%, across all campaigns, to identify the most successful products in terms of incremental revenue.

(Note: Solutions to these ad hoc requests are provided in a separate SQL file.)

### Visualizations
- **Dashboard:** [View the PowerBI dashboard on NovyPro](https://project.novypro.com/k8gRbg)

## Files and Resources
- **Video Presentation:** [Watch the video presentation](https://www.linkedin.com/posts/rachana-hadke_dataanalysis-powerbi-sql-activity-7215054427173318658-qQp-?utm_source=share&utm_medium=member_desktop)

## Conclusion
The analysis provided valuable insights into the effectiveness of the Diwali 2023 and Sankranti 2024 promotions. The findings suggest that promotions significantly boosted sales during the periods and provided actionable recommendations for future promotional strategies.

## Contact Information
For any questions or further information, please contact [LinkedIn](https://www.linkedin.com/in/rachana-hadke).
