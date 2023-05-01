CREATE
OR
REPLACE
FUNCTION public.contas_cliente(p_nome_cliente character varying) RETURNS character
varying LANGUAGE plpgsql AS $function $DECLARE conta_lista character varying := '';
conta_info character varying;
BEGIN
SELECT
array_to_string(
array_agg(
concat(ag.nome_agencia, '-', ct.numero_conta)
ORDER BY
ct.numero_conta
),
', '
) INTO conta_lista
FROM
cliente c
JOIN conta ct ON c.nome_cliente = ct.nome_cliente
JOIN agencia ag ON ct.nome_agencia = ag.nome_agencia
WHERE
c.nome_cliente = p_nome_cliente;
RETURN
conta_lista;
END;
$function $

CREATE
OR
REPLACE
FUNCTION public.faixa_cliente(p_nome_cliente character varying) RETURNS character
LANGUAGE plpgsql AS $function $DECLARE valor_total BIGINT := 0;
classificacao CHAR(1);
BEGIN -- Somando o valor total dos depósitos do cliente
SELECT
SUM(saldo_deposito) INTO valor_total
FROM
deposito
WHERE
nome_cliente = p_nome_cliente;
-- Definindo a classificação com base no valor total
IF valor_total >= 6000 THEN classificacao := 'A';
ELSIF valor_total >= 4000 THEN classificacao := 'B';
ELSE classificacao := 'C';
END IF;
-- Retornando a classificação
RETURN
classificacao;
END;
$function $
