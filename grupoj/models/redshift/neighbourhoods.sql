{{ config(materialized='table') }}

with bairro as(
    SELECT 
        "_file" as origem_arquivo,
        "_line" as linha,
        "_modified" as data_modificacao,
        neighbourhood as bairro,
        "_fivetran_synced"
    FROM s3.covid_airbnd 
    where _file like '%neighbourhoods.csv%'
)

select*from bairro