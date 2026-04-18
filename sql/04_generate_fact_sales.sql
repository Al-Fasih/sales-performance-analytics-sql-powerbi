declare @i int = 1

while @i <= 10000
begin

	declare @product_key int = (abs(checksum(newid())) % 40) + 1
	declare @customer_key int = (abs(checksum(newid())) % 120) + 1
	declare @sales_rep_key int = (abs(checksum(newid())) % 12) + 1
	declare @region_key int = (abs(checksum(newid())) % 10) + 1
	declare @channel_key int = (abs(checksum(newid())) % 4) + 1

	-- data aleatória da dim_date
	declare @date_key int = (
		select top 1 date_key from dim_date order by newid()
	)

	-- pegar dados do produto
	declare @unit_price decimal(10,2)
	declare @unit_cost decimal(10,2)

	select 
		@unit_price = standard_price,
		@unit_cost = unit_cost
	from dim_products
	where product_key = @product_key

	-- quantidade (1 a 10)
	declare @quantity int = (abs(checksum(newid())) % 10) + 1

	-- cálculo financeiro
	declare @gross decimal(12,2) = @quantity * @unit_price

	-- desconto (0% a 20%)
	declare @discount_pct decimal(5,4) = (abs(checksum(newid())) % 21) / 100.0
	declare @discount decimal(12,2) = @gross * @discount_pct

	-- net
	declare @net decimal(12,2) = @gross - @discount

	-- custo total
	declare @total_cost decimal(12,2) = @quantity * @unit_cost

	-- lucro
	declare @profit decimal(12,2) = @net - @total_cost

	-- margem
	declare @margin decimal(5,2)

	if @net = 0
		set @margin = 0
	else
		set @margin = (@profit / @net) * 100

	insert into fact_sales
	(
		sales_id,
		date_key,
		customer_key,
		product_key,
		sales_rep_key,
		region_key,
		channel_key,
		order_number,
		quantity_sold,
		unit_price,
		discount_amount,
		gross_sales_amount,
		total_cost,
		net_sales_amount,
		profit_amount,
		profit_margin_pct
	)
	values
	(
		@i,
		@date_key,
		@customer_key,
		@product_key,
		@sales_rep_key,
		@region_key,
		@channel_key,
		concat('ORD', right('00000' + cast(@i as varchar), 5)),
		@quantity,
		@unit_price,
		@discount,
		@gross,
		@total_cost,
		@net,
		@profit,
		@margin
	)

	set @i = @i + 1

end