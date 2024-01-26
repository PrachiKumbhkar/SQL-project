-- we have loaded the dataset --
-- use the database --
use superstore;
select * from sales;
describe sales;

-- retrieve first 5 rows --

select * from sales limit 5;

--  Question 1..   what are total sales and profit of each year -----
--   total sales --
select salesdone from sales;

select (substr(salesdone ,2 )) from sales;   -- substr() function provide portion of text  

select sum(substr(salesdone,2))  as Toatalsales from sales;

-- total profit --
select profit from sales;
select sum(substr(profit , 2)) as Totalprofit from sales;   -- sum() function to get overall profit

 --  what are total sales and profit of each year  -----
 
select year(order_date) as year ,   --   year is fetched from orderdate using year() function
truncate(sum(substr(salesdone,2)),2)as totalsales , truncate(sum(substr(profit,2)),2) as Totalprofit from sales 
group by year
order by year ;

 -- Question 2 ..  What region generates the highest sales and profits ? --
 
 select region , truncate(sum(substr(salesdone,2)),2) as Totalsales , truncate(sum(substr(profit,2)),2) as Totalprofit 
 from sales
 group by region 
 order by Totalsales desc;
 
 
 -- QUESTION 3 ... What state and city brings in the highest sales and profits ?--

-- states ---
 
 select state, truncate(sum(substr(salesdone,2)),0) as totalsales, truncate(sum(substr(profit,2)),0) as totalprofit from sales
 group by state
 order by totalprofit desc
 limit 10;
 
 -- city --
 select city, truncate(sum(substr(salesdone,2)),0) as totalsales, truncate(sum(substr(profit,2)),0) as totalprofit from sales
 group by city
 order by totalprofit desc
 limit 10;
 
 -- QUESTION 4 .....What is the relationship between discount and sales 
 select discount , truncate(avg(substr(salesdone,2)),0) as avg_sales from sales
 group by discount
 order by discount ;
 
 
 -- and the total discount  and sales per category
 select category from sales ;
 select sum(discount) as discount , truncate(sum(substr(salesdone ,2)),0)  as sales , category from sales
 group by category
order by discount desc;

 -- QUESTION 5....how much profit and sales each category generate. --
 
 select category , truncate(sum(substr(salesdone ,2)),0)  as sales ,  truncate(sum(substr(profit,2)),0) as profit from sales
 group by category
 order by Profit desc;
 
 -- QUESTION 6.... what type of subcategory  are the most discounted. --
 select category , sub_category  , truncate(sum(discount),0) as discount from sales
 group by Category,sub_category 
 order by discount desc;
 
  --  QUESTION 7 ... What category generates the highest sales and profits in each region  ? --
  select region , category ,truncate(sum(substr(salesdone ,2)),0)  as sales ,  truncate(sum(substr(profit,2)),0) as profit 
  from sales
  group by region, category
  order by profit desc;
  
 -- QUESTION 8.... highest total sales and total profits per Category in each state:--
  select state , category ,truncate(sum(substr(salesdone ,2)),0)  as sales ,  truncate(sum(substr(profit,2)),0) as profit 
  from sales
  group by state, category
  order by profit desc;
  
  -- QUESTION 9....What are the names of the products that are the most and least profitable to us?--
  select product_name , truncate(sum(substr(profit,2)),0) as profit from sales 
  group by product_name
  order by profit desc
  limit 5;
  
  -- QUESTION 10...What segment makes the most of our profits and sales ?--

  select distinct(segment) from sales;
  select segment,truncate(sum(substr(salesdone ,2)),0)  as sales , truncate(sum(substr(profit,2)),0) as profit from sales 
  group by segment
  order by profit desc
  limit 5;
  
  -- QUESTION 11 .... How many customers do we have  in total and how much per region and state? --
  
  -- total customers --
  select count(distinct(customer_id)) as total_customers from sales;

  -- customers by region --
  select region , count(distinct(customer_id)) as customer from sales
  group by region ;
  
  -- customer by state --
  select state , count(distinct(customer_id)) as customer from sales
  group by state 
  order by count(distinct(customer_id)) desc;

  
  
  
  