with bike as (
    select 
    start_statio_id as station_id,
    start_station_name,
    start_lat as station_lat,
    start_lng as start_station_lng
     from 
     {{ source('demo_source_name', 'bike') }}
)

select * from bike
