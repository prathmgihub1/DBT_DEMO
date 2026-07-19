with trips as (
    select 
    ride_id,
    rideable_type,
    date(to_timestamp(started_at)) as trip_date,
    start_statio_id ,
    end_station_id,
    member_csual,
    to_timestamp(ended_at)-to_timestamp(started_at),
    TIMESTAMPDIFF(SECOND,to_timestamp(ended_at),to_timestamp(started_at)) AS Trip_duration_seconds
    from {{ source('demo_source_name', 'bike') }}
)

select * from trips