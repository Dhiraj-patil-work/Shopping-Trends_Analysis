create table shopping_trends(
Customer_ID	int,
Age int,
Gender varchar,
Item_Purchased varchar,
Category varchar,
Purchase_Amount float,
Location varchar,
Size varchar,
Color varchar,
Season varchar,
Review_Rating float,
Subscription_Status varchar,
Payment_Method varchar,
Shipping_Type varchar,
Discount_Applied varchar,
Promo_Code_Used	varchar,
Previous_Purchases int,
Preferred_Payment_Method varchar,
Frequency_of_Purchases varchar
);

select * from shopping_trends;

--Q)Which category in shopping trends has highest total purchase amount?--
select category,sum(purchase_amount) as a from shopping_trends 
group by category
order by a desc;

Q)Calculate the average age of customers who has purchased in winter?
select avg(age)
from shopping_trends
where season='Winter';

--Q)Calculate total sales amount?--
select sum(purchase_amount) as Total_sales
from shopping_trends;

--Q)Average Purchase Amount by Category?--
select avg(purchase_amount),category
from shopping_trends
group by category;

--Q)Top 5 Customers by Purchase Amount?--
select sum(purchase_amount),customer_id
from shopping_trends
group by customer_id
order by sum(purchase_amount) desc
limit 5;

--Q) Most Popular Items Purchased?--
select item_purchased,count(*) as popular_items
from shopping_trends
group by item_purchased
order by popular_items desc
limit 10;

--Q)Total Sales by Location?--
select sum(purchase_amount) as total_sales,location
from shopping_trends
group by location
order by total_sales desc
limit 10;

--Q)Payment Methods Usage Count ?--
select payment_method,count(*)
from shopping_trends
group by payment_method
order by count(*) desc
limit 10;

--Q)Percentage of Customers Who Used Promo Codes ?--
select (count(case when promo_code_used='Yes' then 1 end)*100.0/count(*)) as promotcode_used
from shopping_trends;

--Q) Average Review Rating by Category ?--
select avg(review_rating) as average_review_rating,category
from shopping_trends
group by category
order by average_review_rating desc;

--Customer Segmentation Based on Spending--
select Customer_ID,sum(purchase_amount) AS total_spent,
case
    when sum(purchase_amount) > 500 then 'High Spenders'
	when sum(purchase_amount) between 200 and 500 then 'Medium Spenders'
        else'Low Spenders'
    end as spending_category
from shopping_trends
group by customer_id
order by total_spent desc;

--Find customers who purchase frequently (Weekly or Fortnightly)--
select customer_id,frequency_of_purchases,count(*) as purchase_count
from shopping_trends
where frequency_of_purchases in('Weekly','Fortnightly')
group by customer_id,frequency_of_purchases
order by purchase_count desc;

--Q)Find out which season generates the most sales--
select Season, sum(purchase_amount) as total_sales
from shopping_trends
group by Season
order by total_sales desc;
select * from shopping_trends;
