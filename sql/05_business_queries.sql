-- business queries



-- 1. executive overview

-- total revenue, profit and margin
select
    sum(net_sales_amount) as total_revenue,
    sum(profit_amount) as total_profit,
    cast(
        (sum(profit_amount) * 100.0) / nullif(sum(net_sales_amount), 0)
        as decimal(10,2)
    ) as profit_margin_pct
from fact_sales;



-- 2. revenue over time

select
    d.year_number,
    d.month_number,
    d.year_month,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit
from fact_sales f
join dim_date d on f.date_key = d.date_key
group by d.year_number, d.month_number, d.year_month
order by d.year_number, d.month_number;



-- 3. top products by revenue

select top 10
    p.product_name,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit
from fact_sales f
join dim_products p on f.product_key = p.product_key
group by p.product_name
order by revenue desc;



-- 4. products with high revenue and low margin

select
    p.product_name,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit,
    cast(
        (sum(f.profit_amount) * 100.0) / nullif(sum(f.net_sales_amount), 0)
        as decimal(10,2)
    ) as margin_pct
from fact_sales f
join dim_products p on f.product_key = p.product_key
group by p.product_name
having
    sum(f.net_sales_amount) > 0
    and (sum(f.profit_amount) * 100.0) / nullif(sum(f.net_sales_amount), 0) < 10
order by revenue desc;



-- 5. revenue by category

select
    p.category,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit
from fact_sales f
join dim_products p on f.product_key = p.product_key
group by p.category
order by revenue desc;



-- 6. sales rep performance

select
    s.sales_rep_name,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit,
    count(distinct f.order_number) as total_orders
from fact_sales f
join dim_sales_reps s on f.sales_rep_key = s.sales_rep_key
group by s.sales_rep_name
order by revenue desc;



-- 7. top 5 sales reps

select top 5
    s.sales_rep_name,
    sum(f.net_sales_amount) as revenue
from fact_sales f
join dim_sales_reps s on f.sales_rep_key = s.sales_rep_key
group by s.sales_rep_name
order by revenue desc;



-- 8. revenue by region

select
    r.region_name,
    r.state,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit
from fact_sales f
join dim_regions r on f.region_key = r.region_key
group by r.region_name, r.state
order by revenue desc;



-- 9. revenue by channel

select
    c.channel_name,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit
from fact_sales f
join dim_channels c on f.channel_key = c.channel_key
group by c.channel_name
order by revenue desc;



-- 10. channel performance by region

select
    r.state,
    c.channel_name,
    sum(f.net_sales_amount) as revenue
from fact_sales f
join dim_regions r on f.region_key = r.region_key
join dim_channels c on f.channel_key = c.channel_key
group by r.state, c.channel_name
order by r.state, revenue desc;



-- 11. discount impact

select
    case
        when f.discount_amount = 0 then 'no discount'
        when f.discount_amount < 100 then 'low discount'
        else 'high discount'
    end as discount_level,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit,
    cast(
        (sum(f.profit_amount) * 100.0) / nullif(sum(f.net_sales_amount), 0)
        as decimal(10,2)
    ) as margin_pct
from fact_sales f
group by
    case
        when f.discount_amount = 0 then 'no discount'
        when f.discount_amount < 100 then 'low discount'
        else 'high discount'
    end
order by margin_pct desc;



-- 12. average ticket per customer

select
    c.customer_name,
    count(distinct f.order_number) as total_orders,
    sum(f.net_sales_amount) as total_spent,
    cast(
        sum(f.net_sales_amount) / nullif(count(distinct f.order_number), 0)
        as decimal(10,2)
    ) as avg_ticket
from fact_sales f
join dim_customers c on f.customer_key = c.customer_key
group by c.customer_name
order by total_spent desc;



-- 13. weekend vs weekday

select
    d.is_weekend,
    sum(f.net_sales_amount) as revenue,
    sum(f.profit_amount) as profit
from fact_sales f
join dim_date d on f.date_key = d.date_key
group by d.is_weekend
order by d.is_weekend;



-- 14. top customers

select top 10
    c.customer_name,
    sum(f.net_sales_amount) as revenue
from fact_sales f
join dim_customers c on f.customer_key = c.customer_key
group by c.customer_name
order by revenue desc;



-- 15. monthly growth

with monthly_revenue as (
    select
        d.year_number,
        d.month_number,
        sum(f.net_sales_amount) as revenue
    from fact_sales f
    join dim_date d on f.date_key = d.date_key
    group by d.year_number, d.month_number
)

select
    year_number,
    month_number,
    revenue,
    lag(revenue) over (order by year_number, month_number) as previous_month,
    cast(
        (revenue - lag(revenue) over (order by year_number, month_number)) * 100.0
        / nullif(lag(revenue) over (order by year_number, month_number), 0)
        as decimal(10,2)
    ) as growth_pct
from monthly_revenue;