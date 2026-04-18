create table dim_customers (

	customer_key int primary key not null,
	customer_id varchar(50) not null unique,
	customer_name varchar(100) not null,
	gender char(1) not null,
	birth_date date not null,
	age_group varchar(20) not null,
	city varchar(50) not null,
	state varchar(50) not null,
	country varchar(50) not null,
	customer_segment varchar(50) not null,

	constraint ck_dim_customers_gender
		check (gender in ('M', 'F'))

);

create table dim_products (

	product_key int primary key not null,
	product_id varchar(50) not null unique,
	product_name varchar(100) not null,
	category varchar(50) not null,
	subcategory varchar(50) not null,
	brand varchar(50) not null,
	unit_cost decimal(10,2) not null,
	standard_price decimal(10,2) not null,
	launch_date date not null,
	product_status varchar(20) not null

);

create table dim_sales_reps (

	sales_rep_key int primary key not null,
	sales_rep_id varchar(50) not null unique,
	sales_rep_name varchar(100) not null,
	team_name varchar(50) not null,
	manager_name varchar(100) not null,
	hire_date date not null,
	sales_rep_status varchar(20) not null

);

create table dim_regions (

	region_key int primary key not null,
	region_id varchar(50) not null unique,
	region_name varchar(50) not null,
	state varchar(50) not null,
	city varchar(50) not null,
	market_type varchar(50) not null

);

create table dim_channels (

	channel_key int primary key not null,
	channel_id varchar(50) not null unique,
	channel_name varchar(50) not null

);

create table dim_date (

	date_key int primary key not null,
	full_date date not null,
	day_number tinyint not null,
	day_name varchar(10) not null,
	week_number tinyint not null,
	month_number tinyint not null,
	month_name varchar(10) not null,
	quarter_number tinyint not null,
	year_number smallint not null,
	year_month varchar(7) not null,     -- Ex: 2024-01
	semester tinyint not null,        -- 1 ou 2
	is_weekend bit not null,

	constraint ck_dim_date_month_number
		check (month_number between 1 and 12),
	constraint ck_dim_date_day_number
		check (day_number between 1 and 31),
	constraint ck_dim_date_quarter_number
		check (quarter_number between 1 and 4),
	constraint ck_dim_date_semester
		check (semester in (1,2))

);

create table fact_sales (

	sales_id int primary key not null,
	date_key int not null,
	customer_key int not null,
	product_key int not null,
	sales_rep_key int not null,
	region_key int not null,
	channel_key int not null,
	order_number varchar(50) not null,
	quantity_sold int not null,
	unit_price decimal(10,2) not null,
	discount_amount decimal(10,2) not null,
	gross_sales_amount decimal(12,2) not null,
	total_cost decimal(12,2) not null,
	net_sales_amount decimal(12,2) not null,
	profit_amount decimal(12,2) not null,
	profit_margin_pct decimal(5,2) not null,

	constraint fk_fact_sales_date
		foreign key (date_key) references dim_date(date_key),
	constraint fk_fact_sales_customer
		foreign key (customer_key) references dim_customers(customer_key),
	constraint fk_fact_sales_product
		foreign key (product_key) references dim_products(product_key),
	constraint fk_fact_sales_sales_rep
		foreign key (sales_rep_key) references dim_sales_reps(sales_rep_key),
	constraint fk_fact_sales_region
		foreign key (region_key) references dim_regions(region_key),
	constraint fk_fact_sales_channel
		foreign key (channel_key) references dim_channels(channel_key),
	constraint ck_fact_sales_quantity
		check (quantity_sold > 0),
	constraint ck_fact_sales_unit_price
		check (unit_price >= 0),
	constraint ck_fact_sales_discount
		check (discount_amount >= 0),
	constraint ck_fact_sales_gross_sales
		check (gross_sales_amount >= 0),
	constraint ck_fact_sales_total_cost
		check (total_cost >= 0),
	constraint ck_fact_sales_net_sales
		check (net_sales_amount >= 0),
	constraint ck_fact_sales_profit_margin
		check (profit_margin_pct between -100 and 100)

);
