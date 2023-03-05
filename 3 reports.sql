use ChocolateDelightsDB
go

--1. The amount we sell of each product (in order of most popular to least popular)
select o.ItemDesc, QuantitySold = sum(o.Quantity)
from Orders o
group by o.ItemDesc
order by QuantitySold desc
--2. Product details (item number, description, cost of production, wholesale price)
select distinct o.ItemNum, o.ItemDesc, o.ProductionCost, o.WholesalePrice
from orders o
--3. Which products brought in the most money
select top(1) o.ItemDesc, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from orders o
group by o.ItemDesc
order by Profit desc
--4. Which product brought in the least money
select top(1) o.ItemDesc, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from orders o
group by o.ItemDesc
order by Profit 
--5. The peak month for each product
select o.ItemDesc, o.MonthPurchased, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from orders o
group by o.ItemDesc, o.MonthPurchased
order by Profit desc
--6. Which company brings in the most money
select top(1) o.Company, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from orders o
group by o.Company
order by Profit desc
--7. Which customer brings in the least  money
select top(1) o.Company, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from orders o
group by o.Company
order by Profit
--8. How much profit each customer makes on our products (assuming they sell everything)
select o.Company, Profit = sum((o.RetailPrice - o.WholesalePrice) * o.Quantity)
from orders o
group by o.Company
order by Profit
--6. How profit increased/decreased by year per item
; 
with x as(
	select o.YearPurchased, o.ItemDesc, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
	from Orders o
	where o.YearPurchased = 2020
	group by o.YearPurchased, o.ItemDesc
)
select o.ItemDesc, ProfitChange = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity) - x.Profit
from Orders o
join x
on o.ItemDesc = x.ItemDesc
where o.YearPurchased = 2021
group by o.YearPurchased, o.ItemDesc, x.Profit
order by o.YearPurchased



