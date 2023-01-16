/**
    config(materialized indica o formato de materializaÃ§Ã£o no banco de dados)
*/
{{ config(materialized='table') }}

with covid_transformed as (
	
	SELECT 
		arquivo_origem,
		linha, 
		data_modificacao, 	
		to_char(to_date(data_notificacao , 'MM/DD/YYYY'), 'DD/MM/YYYY') AS data_notificacao,
		data_inicio_sintomas, 
		bairro_resid_estadia, 
		area_planej_redid_estadia, 
		evolucao, 
		data_evolucao, 
		cep, 
		data_atualizacao, 
		"_fivetran_synced"
	FROM "redshift-cluster-j".covid

)

select*from covid_transformed
