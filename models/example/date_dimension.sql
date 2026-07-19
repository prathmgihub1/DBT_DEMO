with cte as (
    select 
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    hour(to_timestamp(started_at)) as hour_started_at,

        {{my_new_project.get_day('started_at')}} as Date_type, -- Macro_1

        {{my_new_project.get_season('started_at')}} as station_of_year -- Macro_2
    
     from {{ source('demo_source_name', 'bike') }}
    where started_at != 'started_at'
)

select * from cte