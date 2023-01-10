/**

    config(materialized indica o formato de materialização no banco de dados)

*/

{{ config(materialized='table') }}




with avaliacoes as (

    select

        _file as arquivo_origem,

        _line as linha,

        "_modified" as data_modificacao,

        listing_id,

        date as data,

        "_fivetran_synced"  

    FROM s3.covid_airbnd

    where _file like '%reviews.csv%'



)




select *from avaliacoes