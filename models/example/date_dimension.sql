with cte as (
    select 
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    hour(to_timestamp(started_at)) as hour_started_at,
    case when dayname(to_timestamp(started_at)) in ('Sat','Sun') then 'Weekend'
            else 'Business Day'
            end as Data_type

    
     from {{ source('demo_source_name', 'bike') }}
    where started_at != 'started_at'
)

select * from cte