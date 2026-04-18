SET DATEFIRST 7;

declare @start_date date = '2024-01-01'
declare @end_date date = '2025-12-31'

while @start_date <= @end_date
begin

	insert into dim_date
	(
		date_key,
		full_date,
		day_number,
		day_name,
		week_number,
		month_number,
		month_name,
		quarter_number,
		year_number,
		year_month,
		semester,
		is_weekend
	)
	values
	(
		(year(@start_date) * 10000) + (month(@start_date) * 100) + day(@start_date),

		@start_date,

		day(@start_date),

		format(@start_date, 'dddd', 'en-US'),

		datepart(week, @start_date),

		month(@start_date),

		format(@start_date, 'MMMM', 'en-US'),

		datepart(quarter, @start_date),

		year(@start_date),

		format(@start_date, 'yyyy-MM'),

		case 
			when month(@start_date) <= 6 then 1
			else 2
		end,

		case 
			when datepart(weekday, @start_date) in (1,7) then 1
			else 0
		end
	)

	set @start_date = dateadd(day, 1, @start_date)

end