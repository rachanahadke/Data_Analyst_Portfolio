
-- Solution 1 
-- Below query features products with base price > 500 and in promo type 'BOGOF'(Buy one get one free)
Select
	distinct(p.product_name), 																						-- product_name from dim_products table
    f.base_price 																									-- base_price from dim_events table
from 
	retail_events_db.dim_products p
LEFT JOIN 																											--  to consider all the products from dim_products table
	retail_events_db.fact_events f
ON
	p.product_code = f.product_code
WHERE
	f.base_price > 500 																								-- to filter products with price > 500
    AND f.promo_type = "BOGOF" 																						-- to filter products with promo type "BOGOF"



 -- Solution 2
 -- The below query lists number of stores in each city
SELECT
	city,
	count(store_id) as store_count
FROM 
	retail_events_db.dim_stores
GROUP BY 
	city																											-- to calculate number of stores in each city
ORDER BY
	store_count desc																								-- cities with store count from highest to lowest
;


 -- Solution 3
SELECT
    c.campaign_name,																								-- campaign name from dim_campaigns column
    round(SUM(f.base_price * f.`quantity_sold(before_promo)`)/1000000,2) AS `total_revenue(before_promotion)`,				-- Revenue before promotions
    round(																											-- To display the value in millions 
		SUM(																										-- Calculating revenue from products according to promo_type
			CASE WHEN f.promo_type = '25% off' THEN f.base_price * f.`quantity_sold(after_promo)` * 0.75							
				 WHEN f.promo_type = '50% off' THEN f.base_price * f.`quantity_sold(after_promo)` * 0.5
				 WHEN f.promo_type = '33% off' THEN f.base_price * f.`quantity_sold(after_promo)` * 0.67
				 WHEN f.promo_type = 'BOGOF' THEN  f.base_price * f.`quantity_sold(after_promo)` * 0.5 * 2
				 WHEN f.promo_type = '500 cashback' THEN (CASE WHEN f.base_price > 500 THEN (f.base_price - 500) * f.`quantity_sold(after_promo)` ELSE 0 END)
				 ELSE 0 END
		)
	/1000000, 2) AS `total_revenue(after_promotion)`																			--	 Revenue after promotions																													
FROM
    retail_events_db.dim_campaigns c
INNER JOIN
    retail_events_db.fact_events f ON c.campaign_id = f.campaign_id
GROUP BY
    c.campaign_name;																								-- grouping by campaign name



-- Solution 4
-- Below query calculates the Incremental Sold Quantity (ISU%) for each category during Diwali campaign
SELECT
	p.category,																										-- category column from dim_products table
    round(
		(
			(
				(sum(
					  Case 
					  When promo_type = "BOGOF" Then `quantity_sold(after_promo)`*2
					  Else `quantity_sold(after_promo)`
					  End
                )) - (sum(f.`quantity_sold(before_promo)`))
			) / nullif(sum(f.`quantity_sold(before_promo)`),0)														-- taking care of divide by 0 error 
		) *100
	, 2) AS `ISU%`,																									-- Calculating ISU% using formula ((quantity sold after promotions - quantity before promo) / quantity sold before promo) *100
	rank() over(
		order by (
			(
				(sum(
					  Case 
					  When promo_type = "BOGOF" Then `quantity_sold(after_promo)`*2
					  Else `quantity_sold(after_promo)`
					  End
                )) - (sum(f.`quantity_sold(before_promo)`))
			) / nullif(sum(f.`quantity_sold(before_promo)`),0)
		) desc													
	) AS rank_order 																								-- using rank function to order catergory accoring to ISU%
FROM 
	retail_events_db.dim_products p 
LEFT JOIN																											-- to get data for all categories from dim_products table
	retail_events_db.fact_events f
ON 
	p.product_code = f.product_code
WHERE
	f.campaign_id ="CAMP_DIW_01" 																					-- to filter the results for Diwali campaign 
GROUP BY
	p.category
;



-- Solution 5 
-- Below query calculates Top 5 products, ranked by Incremental Revenue Percentage(IR%) across all campaigns

SELECT 
	p.product_name, 																							    -- product_name column from dim_products table
    p.category,																										-- catergory column from dim_products table
    ROUND(
		(
			(
				(
					SUM(
						CASE WHEN f.promo_type = '25% off' THEN f.base_price * f.`quantity_sold(after_promo)` * 0.75
							 WHEN f.promo_type = '50% off' THEN f.base_price * f.`quantity_sold(after_promo)` * 0.5
							 WHEN f.promo_type = '33% off' THEN f.base_price * f.`quantity_sold(after_promo)` * 0.67
							 WHEN f.promo_type = 'BOGOF' THEN f.base_price * 0.5 * f.`quantity_sold(after_promo)` * 2 
							 WHEN f.promo_type = '500 cashback' THEN (CASE WHEN f.base_price > 500 THEN (f.base_price - 500) * f.`quantity_sold(after_promo)` ELSE 0 END)
							 ELSE 0 END
					)																									-- revenue generated after the promotions
					-
					(SUM(f.base_price * f.`quantity_sold(before_promo)`)) 												-- revenue generated before the promotions
				) 
				/ nullif((SUM(f.base_price * f.`quantity_sold(before_promo)`)),0)										-- handling divide by 0 error
			)* 100
		), 2
    ) AS `IR%`																										-- Calculating IR% using formula ((revenue generated after promotions -revenue generated before promo) / revenue generated before promo) *100																												
FROM 
	retail_events_db.dim_products p
LEFT JOIN																											-- since we want all the products to be considered from dim_products table
	retail_events_db.fact_events f
ON 
	p.product_code = f.product_code 
GROUP BY 
	p.product_code,
    p.category
ORDER BY
	`IR%` desc																										-- Product_name to be listed from highest to lowest based on IR%																											
LIMIT 5																												-- to list the top 5 products	
;  


