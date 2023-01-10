
/**
    config(materialized indica o formato de materialização no banco de dados)
*/
{{ config(materialized='table') }}


create table listings as (
	select 
		id,
		_file as arquivo_origem,
		_line as linha,
		"_modified" as data_modificacao,
		name as nome,
		host_id,
		host_name,
		neighbourhood as bairro,
		latitude,
		longitude,
		room_type as tipo_sala,
		price as preco ,
		minimum_nights as minimo_noites,
		number_of_reviews as numero_revisoes,
		last_review as ultima_revisao,
		reviews_per_month as revisoes_mes,
		calculated_host_listings_count as contagem_calculada_listagens,
		availability_365,
		number_of_reviews_ltm,
		"_fivetran_synced"	
	FROM s3.covid_airbnd
	where _file like '%listings.csv%'

)