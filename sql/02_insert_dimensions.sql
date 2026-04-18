insert into dim_channels (channel_key, channel_id, channel_name) values
(1, 'CH001', 'Online'),
(2, 'CH002', 'Retail Store'),
(3, 'CH003', 'Marketplace'),
(4, 'CH004', 'Inside Sales');

insert into dim_regions (region_key, region_id, region_name, state, city, market_type) values
(1, 'R001', 'Southeast', 'SP', 'São Paulo', 'Urban'),
(2, 'R002', 'Southeast', 'RJ', 'Rio de Janeiro', 'Urban'),
(3, 'R003', 'South', 'RS', 'Porto Alegre', 'Urban'),
(4, 'R004', 'South', 'PR', 'Curitiba', 'Urban'),
(5, 'R005', 'Northeast', 'BA', 'Salvador', 'Urban'),
(6, 'R006', 'Northeast', 'CE', 'Fortaleza', 'Urban'),
(7, 'R007', 'Midwest', 'DF', 'Brasília', 'Urban'),
(8, 'R008', 'North', 'AM', 'Manaus', 'Urban'),
(9, 'R009', 'Southeast', 'MG', 'Belo Horizonte', 'Urban'),
(10, 'R010', 'South', 'SC', 'Florianópolis', 'Urban');

insert into dim_products
(product_key, product_id, product_name, category, subcategory, brand, unit_cost, standard_price, launch_date, product_status)
values
(1, 'P001', 'Laptop Pro 15', 'Electronics', 'Laptop', 'TechBrand', 2500, 3500, '2023-01-10', 'Active'),
(2, 'P002', 'Wireless Mouse', 'Electronics', 'Accessories', 'TechBrand', 50, 120, '2023-02-15', 'Active'),
(3, 'P003', 'Mechanical Keyboard', 'Electronics', 'Accessories', 'KeyPro', 120, 300, '2023-03-01', 'Active'),
(4, 'P004', 'Office Chair', 'Furniture', 'Chair', 'ComfortSeat', 400, 900, '2023-01-20', 'Active'),
(5, 'P005', 'Standing Desk', 'Furniture', 'Desk', 'ComfortSeat', 700, 1500, '2023-04-10', 'Active'),
(6, 'P006', 'Notebook Pack', 'Office Supplies', 'Paper', 'OfficeMax', 10, 35, '2023-01-05', 'Active'),
(7, 'P007', 'Pen Set', 'Office Supplies', 'Stationery', 'WritePro', 5, 20, '2023-02-01', 'Active'),
(8, 'P008', 'Monitor 24"', 'Electronics', 'Monitor', 'ViewTech', 600, 1100, '2023-03-10', 'Active'),
(9, 'P009', 'USB Hub', 'Electronics', 'Accessories', 'TechBrand', 20, 80, '2023-02-20', 'Active'),
(10, 'P010', 'Printer', 'Electronics', 'Printer', 'PrintMax', 500, 1200, '2023-01-25', 'Discontinued'),
(11, 'P011', 'Gaming Laptop X', 'Electronics', 'Laptop', 'TechBrand', 3200, 4500, '2023-05-01', 'Active'),
(12, 'P012', 'Business Laptop Slim', 'Electronics', 'Laptop', 'TechBrand', 2800, 3900, '2023-06-01', 'Active'),
(13, 'P013', 'Ergonomic Mouse', 'Electronics', 'Accessories', 'ComfortTech', 40, 110, '2023-02-01', 'Active'),
(14, 'P014', 'Bluetooth Headset', 'Electronics', 'Audio', 'SoundMax', 150, 400, '2023-03-10', 'Active'),
(15, 'P015', 'Noise Canceling Headphones', 'Electronics', 'Audio', 'SoundMax', 300, 800, '2023-04-01', 'Active'),
(16, 'P016', 'LED Monitor 27"', 'Electronics', 'Monitor', 'ViewTech', 800, 1500, '2023-05-20', 'Active'),
(17, 'P017', 'UltraWide Monitor', 'Electronics', 'Monitor', 'ViewTech', 1200, 2200, '2023-06-10', 'Active'),
(18, 'P018', 'Office Desk Basic', 'Furniture', 'Desk', 'ComfortSeat', 500, 1100, '2023-02-10', 'Active'),
(19, 'P019', 'Executive Desk', 'Furniture', 'Desk', 'ComfortSeat', 900, 1800, '2023-03-15', 'Active'),
(20, 'P020', 'Ergonomic Chair Pro', 'Furniture', 'Chair', 'ComfortSeat', 600, 1300, '2023-04-20', 'Active'),
(21, 'P021', 'Whiteboard Large', 'Office Supplies', 'Office Equipment', 'OfficeMax', 150, 400, '2023-01-10', 'Active'),
(22, 'P022', 'Stapler Set', 'Office Supplies', 'Stationery', 'WritePro', 15, 60, '2023-01-15', 'Active'),
(23, 'P023', 'Printer Laser', 'Electronics', 'Printer', 'PrintMax', 700, 1600, '2023-02-20', 'Active'),
(24, 'P024', 'Ink Cartridge Pack', 'Office Supplies', 'Printer Supplies', 'PrintMax', 50, 180, '2023-02-25', 'Active'),
(25, 'P025', 'USB Keyboard Basic', 'Electronics', 'Accessories', 'TechBrand', 60, 150, '2023-01-30', 'Active'),
(26, 'P026', 'External SSD 1TB', 'Electronics', 'Storage', 'DataPro', 350, 900, '2023-03-05', 'Active'),
(27, 'P027', 'External HDD 2TB', 'Electronics', 'Storage', 'DataPro', 250, 600, '2023-03-08', 'Active'),
(28, 'P028', 'Smartphone Pro', 'Electronics', 'Mobile', 'PhoneMax', 1800, 3200, '2023-05-01', 'Active'),
(29, 'P029', 'Smartphone Basic', 'Electronics', 'Mobile', 'PhoneMax', 800, 1500, '2023-05-01', 'Active'),
(30, 'P030', 'Tablet 10"', 'Electronics', 'Mobile', 'TechBrand', 900, 1800, '2023-06-01', 'Active'),
(31, 'P031', 'Router Wi-Fi 6', 'Electronics', 'Networking', 'NetPro', 200, 500, '2023-02-10', 'Active'),
(32, 'P032', 'Switch 8 Ports', 'Electronics', 'Networking', 'NetPro', 120, 350, '2023-02-12', 'Active'),
(33, 'P033', 'Projector HD', 'Electronics', 'Office Equipment', 'ViewTech', 900, 2000, '2023-03-20', 'Active'),
(34, 'P034', 'Paper A4 Box', 'Office Supplies', 'Paper', 'OfficeMax', 80, 200, '2023-01-05', 'Active'),
(35, 'P035', 'Notebook Premium', 'Office Supplies', 'Paper', 'OfficeMax', 20, 60, '2023-01-06', 'Active'),
(36, 'P036', 'Desk Lamp LED', 'Furniture', 'Accessories', 'LightCo', 70, 200, '2023-02-01', 'Active'),
(37, 'P037', 'Cable Organizer Kit', 'Electronics', 'Accessories', 'TechBrand', 15, 50, '2023-02-02', 'Active'),
(38, 'P038', 'Surge Protector', 'Electronics', 'Accessories', 'PowerSafe', 40, 120, '2023-02-03', 'Active'),
(39, 'P039', 'Webcam HD', 'Electronics', 'Accessories', 'TechBrand', 120, 350, '2023-03-01', 'Active'),
(40, 'P040', 'Microphone USB', 'Electronics', 'Audio', 'SoundMax', 180, 500, '2023-03-05', 'Active');

insert into dim_sales_reps
(sales_rep_key, sales_rep_id, sales_rep_name, team_name, manager_name, hire_date, sales_rep_status)
values
(1, 'SR001', 'Carlos Mendes', 'Team A', 'Roberto Lima', '2022-01-10', 'Active'),
(2, 'SR002', 'Fernanda Silva', 'Team A', 'Roberto Lima', '2022-03-15', 'Active'),
(3, 'SR003', 'Lucas Pereira', 'Team B', 'Marcos Souza', '2023-02-01', 'Active'),
(4, 'SR004', 'Juliana Costa', 'Team B', 'Marcos Souza', '2023-05-10', 'Active'),
(5, 'SR005', 'Rafael Santos', 'Team C', 'Ana Paula', '2021-08-20', 'Inactive'),
(6, 'SR006', 'Bruno Rocha', 'Team A', 'Roberto Lima', '2022-06-10', 'Active'),
(7, 'SR007', 'Patricia Gomes', 'Team A', 'Roberto Lima', '2022-07-12', 'Active'),
(8, 'SR008', 'Daniel Alves', 'Team B', 'Marcos Souza', '2023-01-20', 'Active'),
(9, 'SR009', 'Renata Dias', 'Team B', 'Marcos Souza', '2023-03-01', 'Active'),
(10, 'SR010', 'Eduardo Lima', 'Team C', 'Ana Paula', '2021-11-11', 'Active'),
(11, 'SR011', 'Carla Fernandes', 'Team C', 'Ana Paula', '2022-02-22', 'Active'),
(12, 'SR012', 'Thiago Martins', 'Team C', 'Ana Paula', '2023-05-05', 'Active');

-- automatic customer generation
declare @i int = 1

while @i <= 120
begin
	insert into dim_customers
	(customer_key, customer_id, customer_name, gender, birth_date, age_group, city, state, country, customer_segment)
	values
	(
		@i,
		concat('C', right('000' + cast(@i as varchar), 3)),
		concat('Customer ', @i),

		case when @i % 2 = 0 then 'M' else 'F' end,

		dateadd(year, - (20 + (@i % 30)), getdate()),

		case 
			when @i % 3 = 0 then '20-30'
			when @i % 3 = 1 then '30-40'
			else '40-50'
		end,

		-- city
		case (@i % 6)
			when 0 then 'São Paulo'
			when 1 then 'Rio de Janeiro'
			when 2 then 'Curitiba'
			when 3 then 'Belo Horizonte'
			when 4 then 'Salvador'
			else 'Brasília'
		end,

		-- state
		case (@i % 6)
			when 0 then 'SP'
			when 1 then 'RJ'
			when 2 then 'PR'
			when 3 then 'MG'
			when 4 then 'BA'
			else 'DF'
		end,

		'Brazil',

		case 
			when @i % 3 = 0 then 'Consumer'
			when @i % 3 = 1 then 'Corporate'
			else 'Small Business'
		end
	)
	set @i = @i + 1
end