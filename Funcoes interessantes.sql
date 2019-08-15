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

--Formatar cpf de uma maneira dificil

SELECT SUBSTR(cpf, 1, 3) || '.' || SUBSTR(cpf, 4, 3) || '.' ||
SUBSTR(cpf, 7, 3) || '-' || SUBSTR(cpf, 10) AS CPF
FROM natural_person

--Formatar cpf de uma maneira tão dificil quanto

SELECT  
REGEXP_REPLACE (cpf,  '(\d{3})(\d{3})(\d{3})(\d{2})',  '\1.\2.\3-\4') AS cpf 
FROM tb_alunos;

--Gerando uma funcao que formata cpf

CREATE OR REPLACE FUNCTION formata_cpf(
  p_cpf IN VARCHAR2
) RETURN VARCHAR2
IS
BEGIN
  RETURN regexp_replace(LPAD(p_cpf, 11),'(\d{3})(\d{3})(\d{3})','\1.\2.\3-\4');
END;
