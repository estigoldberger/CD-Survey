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

--3. how much each product brought in (most to least)
select o.ItemDesc, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from orders o
group by o.ItemDesc
order by Profit desc

--4. The peak month for each product
;with AmountSoldPerItemPerMonth as (
select o.ItemDesc, o.MonthPurchased, AmountSold = sum(o.Quantity)
from orders o
group by o.ItemDesc, o.MonthPurchased
), MaxAmount as (
select ItemDesc, MaxAmount = max(AmountSold) 
from AmountSoldPerItemPerMonth
group by ItemDesc
)
select a.*
from AmountSoldPerItemPerMonth a
join MaxAmount m
on m.ItemDesc = a.ItemDesc and m.MaxAmount = a.AmountSold

--5. How much each company brings (most to least)
select  o.Company, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from orders o
group by o.Company
order by Profit desc

--6. How much profit each customer makes on our products (assuming they sell everything)
select o.Company, Profit = sum((o.RetailPrice - o.WholesalePrice) * o.Quantity)
from orders o
group by o.Company
order by o.Company

--7. How profit increased/decreased by year per item
;
with FirstYear as(select o.YearPurchased, o.ItemDesc, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from Orders o
group by o.YearPurchased, o.ItemDesc),
SecondYear as (SELECT o.YearPurchased, o.ItemDesc, Profit = sum((o.WholesalePrice - o.ProductionCost) * o.Quantity)
from Orders o
group by o.YearPurchased, o.ItemDesc)
select c1.YearPurchased, c1.ItemDesc, YearlyGrowth = c1.Profit - c2.Profit 
from SecondYear c1
left join FirstYear c2 on c1.ItemDesc = c2.ItemDesc AND c2.YearPurchased = c1.YearPurchased - 1


