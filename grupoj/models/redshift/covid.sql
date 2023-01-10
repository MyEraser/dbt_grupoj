/**
    config(materialized indica o formato de materializaÃ§Ã£o no banco de dados)
*/
{{ config(materialized='table') }}


with covid as (
	select 
		_file as arquivo_origem,
		_line as linha,
		"_modified" as data_modificacao,
		dt_notific as data_notificacao,
		dt_inicio_sintomas as data_inicio_sintomas,
		bairro_resid__estadia,
		ap_residencia_estadia as area_planej_redid_estadia,
		evolucao,
		dt_evolucao as data_evolucao,
		cep,
		data_atualizacao,
		"_fivetran_synced"	
	FROM s3.covid_airbnd
	where _file like '%covid.csv%'

)


select *from covid