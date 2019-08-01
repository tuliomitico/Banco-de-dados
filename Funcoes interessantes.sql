--Saber as tabelas de um determinado Schemas

SELECT
   *
FROM
   pg_catalog.pg_tables
WHERE
   schemaname = 'casas'
AND schemaname != 'information_schema';

--Definir o caminho de consulta em um schema

set search_path to casas;	