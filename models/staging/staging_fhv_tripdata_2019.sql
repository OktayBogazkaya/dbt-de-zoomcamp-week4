{{ config(materialized='view') }}

select 

    cast(PUlocationID as integer) as pickup_locationid,
    cast(DOlocationID as integer) as dropoff_locationid,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime

from {{ source('staging','fhv_tripdata_2019') }}

-- dbt build --m <model.sql> --var 'is_test_run: false'
--{% if var('is_test_run', default=true) %}

--  limit 100

--{% endif %}