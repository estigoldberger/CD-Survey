use ChocolateDelightsDB
go

drop table if exists Orders
go

create table Orders(
	OrderId int not null identity primary key,
	Company varchar(50) not null constraint ck_Orders_Company_cannot_be_blank check(Company > ''),
	City varchar(50) not null constraint ck_Orders_City_cannot_be_blank check(City > ''),
	State char(2) not null constraint ck_Orders_State_must_be_NY_NJ_or_CT check(State in ('NY', 'NJ', 'CT')),
	Email varchar(50) not null constraint ck_Orders_Email_cannot_be_blank check(Email > ''),
	ItemNum int not null constraint ck_Orders_ItemNum_greater_than_or_equals_1100 check(ItemNum >= 1100),
	ItemDesc varchar(50) not null constraint ck_Orders_ItemDesc_cannot_be_blank check(ItemDesc > ''),
	ProductionCost decimal(6,2) not null constraint ck_Orders_ProductionCost_greater_than_zero check(ProductionCost > 0),
	WholesalePrice as ProductionCost * 1.2 persisted,
	RetailPrice decimal(6,2) not null, 
	Quantity int not null constraint ck_Orders_Quantity_greater_than_zero check(Quantity > 0),
	MonthPurchased varchar(9) constraint ck_Orders_MonthPurchased_cannot_be_blank check(MonthPurchased > ''),
	YearPurchased int constraint ck_Orders_YearPurchased_between_2013_and_2023 check(YearPurchased between 2013 and 2023),
	constraint ck_Orders_RetailPrice_raised_at_least_40_percent_from_WholesalePrice check(RetailPrice >= (WholesalePrice * 1.4))
)
go