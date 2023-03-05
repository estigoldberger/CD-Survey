use ChocolateDelightsDB
go

insert Orders(Company, City, State, Email, ItemNum, ItemDesc, ProductionCost, Quantity, MonthPurchased, YearPurchased, RetailPrice)
select 'Sam''s Kosher Mart', 'Mill Basin', 'NY', 'samorders@gmail.com', 1165, 'Chocolate Marshmallows', .65,  219,  'February', 2018, 1.2
union select 'Kaila''s Cookery', 'New Haven','CT', 'Kailacookery@iccloud.com', 1103, 'Chocolate Covered Snackers', .78,  30, 'March', 2013, 1.40
union select 'FreshTown', 'Monsey','NY', 'customerservice@freshtown.com', 1123, 'Pecan Chocolate', 2.00,  7, 'October', 2021, 3.36 
union select 'Glatt Mart', 'Manchester', 'NJ', 'chaim@glattmart.com', 1145, 'Dairy Chocolate Strawberry', .86,  75, 'October', 2023, 1.5
union select 'Confection Connection', 'Lakewood','NJ', 'goldyklein@gmail.com', 1100, 'Dairy Chocolate Balls', 1.10,  800, 'June', 2018, 2.15
union select 'HaMakolet', 'Waterbury', 'CT', 'hamakolet@gmail.com', 1186, 'Milk Truffles', 1.5,  7, 'May', 2022, 2.52 
union select 'Kaila''s Cookery', 'New Haven','CT', 'Kailacookery@iccloud.com', 1145, 'Dairy Chocolate Strawberry', .86,   100, 'March', 2013, 4.20
union select 'FreshTown', 'Monsey','NY', 'customerservice@freshtown.com', 1186, 'Milk Truffles', 1.5, 25, 'June', 2020, 3.36 
union select 'Glatt Mart', 'Manchester', 'NJ', 'chaim@glattmart.com', 1103, 'Chocolate Covered Snackers', .78,  100, 'October', 2022, 3.33
union select 'Confection Connection', 'Lakewood','NJ', 'goldyklein@gmail.com', 1100, 'Dairy Chocolate Balls', 1.10,  450, 'July', 2019, 2.38
union select 'HaMakolet', 'Waterbury', 'CT', 'hamakolet@gmail.com', 1123, 'Pecan Chocolate', 2.00,  70, 'May', 2022, 3.78