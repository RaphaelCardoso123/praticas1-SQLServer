SELECT * FROM TABELA_DE_CLIENTES;
SELECT * FROM TABELA_DE_PRODUTOS;
SELECT * FROM TABELA_DE_VENDEDORES;
SELECT * FROM NOTAS_FISCAIS;
SELECT * FROM ITENS_NOTAS_FISCAIS;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT CPF, NOME, IDADE FROM TABELA_DE_CLIENTES;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DO CLIENTE] FROM TABELA_DE_CLIENTES TDC;
SELECT TDC.IDADE, TDC.BAIRRO FROM TABELA_DE_CLIENTES TDC;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE < 20;

SELECT* FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'PET';
SELECT* FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '243083';

SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= '1995/10/25';

SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO >= 'LAPA';
---------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'MANGA' AND TAMANHO = '350 ML';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'MANGA' OR TAMANHO = '1,5 LITROS';
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'MANGA' AND TAMANHO = '350 ML');
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'MANGA' OR SABOR = 'UVA' OR SABOR = 'MELANCIA';

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('MANGA', 'UVA', 'MELANCIA');
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('MANGA', 'UVA', 'MELANCIA') AND TAMANHO = '1 LITRO';

SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('RIO DE JANEIRO', 'SAO PAULO') AND IDADE > = 20 AND IDADE <=25;
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('RIO DE JANEIRO', 'SAO PAULO') AND IDADE BETWEEN 20 AND 25;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'MORANGO%';

SELECT * FROM TABELA_DE_CLIENTES WHERE NOME LIKE '%SILVA%';
---------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;

SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT TOP 5 * FROM TABELA_DE_CLIENTES;
SELECT TOP 5 NOME FROM TABELA_DE_CLIENTES;
SELECT TOP 10 * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2017/10/01';
---------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO DESC;
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO DESC;
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

SELECT * FROM TABELA_DE_PRODUTOS WHERE NOME_DO_PRODUTO = 'LINHA REFRESCANTE - 1 LITRO - MORANGO/LIMAO';
SELECT * FROM ITENS_NOTAS_FISCAIS WHERE CODIGO_DO_PRODUTO = '1101035' ORDER BY QUANTIDADE DESC;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES;
SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;
SELECT CIDADE, SUM(IDADE) FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
SELECT CIDADE, SUM(IDADE) AS IDADE, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
SELECT CIDADE, AVG(IDADE) AS IDADE, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
SELECT CIDADE, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
SELECT EMBALAGEM, COUNT(*) AS PRODUTOS FROM TABELA_DE_PRODUTOS WHERE SABOR = 'LARANJA' GROUP BY EMBALAGEM;
SELECT COUNT(*) AS VENDAS FROM ITENS_NOTAS_FISCAIS WHERE CODIGO_DO_PRODUTO = '1101035';

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY ESTADO;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) >= 900000 ;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 GROUP BY EMBALAGEM;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 GROUP BY EMBALAGEM HAVING MAX(PRECO_DE_LISTA) >= 20;

SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS GROUP BY CODIGO_DO_PRODUTO ORDER BY SUM(QUANTIDADE) DESC;
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS GROUP BY CODIGO_DO_PRODUTO HAVING  SUM(QUANTIDADE) > 394000 ORDER BY SUM(QUANTIDADE) DESC;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT NOME, (CASE WHEN VOLUME_DE_COMPRA >= 22000 THEN 'GRANDE' ELSE 'PEQUENO' END) FROM TABELA_DE_CLIENTES;

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
	(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	 WHEN PRECO_DE_LISTA >= 7 THEN 'PRODUTO EM CONTA'
	 ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS WHERE SABOR = 'MANGA';

SELECT NOME, LIMITE_DE_CREDITO,
	(CASE WHEN LIMITE_DE_CREDITO >= 150000 THEN 'CLIENTES GRANDES'
	WHEN LIMITE_DE_CREDITO BETWEEN 150000 AND 110000 THEN 'CLIENTES MEDIOS'
	ELSE 'CLIENTES PEQUENOS' END) AS TAMANHO_DE_CLIENTES
FROM TABELA_DE_CLIENTES ORDER BY TAMANHO_DE_CLIENTES DESC;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT MATRICULA, COUNT(*) AS NUMERO_NOTAS FROM NOTAS_FISCAIS GROUP BY MATRICULA;

SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_NOTAS
	FROM NOTAS_FISCAIS
	INNER JOIN TABELA_DE_VENDEDORES
	ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
	GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

SELECT NOTFISC.MATRICULA, TABVEND.NOME, COUNT(*) AS NUMERO_NOTAS
	FROM NOTAS_FISCAIS NOTFISC
	INNER JOIN TABELA_DE_VENDEDORES TABVEND
	ON NOTFISC.MATRICULA = TABVEND.MATRICULA
	GROUP BY NOTFISC.MATRICULA, TABVEND.NOME;

SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE 
	FROM ITENS_NOTAS_FISCAIS  INF
	INNER JOIN TABELA_DE_PRODUTOS TP 
	ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
	GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
	ORDER BY SUM(INF.QUANTIDADE) DESC;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT
TC.CPF AS [CPF DO REGISTRO]
, TC.NOME AS [NOME DO CLIENTE]
, NF.CPF AS [CPF DA NOTA]
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF

SELECT DISTINCT
TC.CPF AS [CPF DO REGISTRO]
, TC.NOME AS [NOME DO CLIENTE]
, NF.CPF AS [CPF DA NOTA]
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO TABELA_DE_CLIENTES
(CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO
, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES
('215478566', 'JULIANA SILVA', 'R.COLUMBIA', '', 'BANGU', 'RIO DE JANEIRO'
, 'RJ', '24588556', '1989-12-11', 33, 'F', 180000, 240000, 0);

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT
TC.CPF AS [CPF DO REGISTRO]
, TC.NOME AS [NOME DO CLIENTE]
, NF.CPF AS [CPF DA NOTA]
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF

SELECT DISTINCT
TC.CPF AS [CPF DO REGISTRO]
, TC.NOME AS [NOME DO CLIENTE]
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
--16 clientes
SELECT COUNT(*) FROM TABELA_DE_VENDEDORES;
--4 vendedores
SELECT DISTINCT
  TC.NOME AS [NOME DO CLIENTE]
, TC.BAIRRO AS [BAIRRO DO CLIENTE]
, TV.NOME AS [NOME DO VENDEDOR]
, TV.BAIRRO AS [BAIRRO DO VENDEDOR]
FROM
TABELA_DE_CLIENTES TC
INNER JOIN
TABELA_DE_VENDEDORES TV
ON
TC.BAIRRO = TV.BAIRRO;
-- 16 cliente   -> 7 clientes possuem em seus bairros vendedores
-- 4 vendedores -> 3 vendedores possuem em seus bairros clientes

-- qual � o vendedor que n�o possui cliente no seu bairro?
SELECT DISTINCT
  TC.BAIRRO AS [BAIRRO DO CLIENTE]
, TV.NOME AS [NOME DO VENDEDOR]
, TV.BAIRRO AS [BAIRRO DO VENDEDOR]
FROM
TABELA_DE_CLIENTES TC
RIGHT JOIN
TABELA_DE_VENDEDORES TV
ON
TC.BAIRRO = TV.BAIRRO
WHERE TC.NOME IS NULL;
-- resposta: 1 vendedor

--quais s�o os clientes que n�o possuem vendedores no seu bairro?
SELECT DISTINCT
  TC.NOME AS [NOME DO CLIENTE]
, TC.BAIRRO AS [BAIRRO DO CLIENTE]
, TV.NOME AS [NOME DO VENDEDOR]
FROM
TABELA_DE_CLIENTES TC
LEFT JOIN
TABELA_DE_VENDEDORES TV
ON
TC.BAIRRO = TV.BAIRRO
WHERE TV.NOME IS NULL;
-- resposta: 9 clientes

-- usando FULL JOIN  ele me responde as duas perguntas de uma s� vez
SELECT DISTINCT
  TV.NOME AS [NOME DO VENDEDOR]
, TV.BAIRRO AS [BAIRRO DO VENDEDOR]
, TC.NOME AS [NOME DO CLIENTE]
, TC.BAIRRO AS [BAIRRO DO CLIENTE]
FROM
TABELA_DE_CLIENTES TC
FULL JOIN
TABELA_DE_VENDEDORES TV
ON
TC.BAIRRO = TV.BAIRRO;
---------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;
-- 12 bairros relacionado com clientes

SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
-- 4 bairros relacionado com vendedores

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
-- 13 bairros juntando as duas pesquisas sem repetir 

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
-- 16 bairros juntando as duas tabelas repetindo bairros em comum

SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGIEM FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;
---------------------------------------------------------------------------------------------------------------------------------------
--subconsultas(subquery)

SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;
--resultado: Copacabana, Jardins, Santo Amaro, Tijuca
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO IN ('Copacabana', 'Jardins', 'Santo Amaro', 'Tijuca');
--vai dar o resultado esperado

--ao inv�s de ter que fazer essas duas consultas para chegar no resultado desejado, posso fazer assim:
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);
--dessa forma tenho o msm resultado que as duas pesquisas anteriores
---------------------------------------------------------------------------------------------------------------------------------------
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;
--assim mostra CODIGO_DO_PRODUTO, NOME_DO_PRODUTO E QUANTIDADE.

SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, TP.SABOR, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, TP.SABOR HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;
--assim mostra CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, QUANTIDADE e tamb�m inclui SABOR.

--subconsultas(subquery)
SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS WHERE
CODIGO_DO_PRODUTO IN (
SELECT INF.CODIGO_DO_PRODUTO FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 );
--assim vai mostrar SABOR usando SUBCONSULTAS
---------------------------------------------------------------------------------------------------------------------------------------
--subconsultas(subquery)
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS [PRECO MEDIO]
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
--vai mostrar embalagem e o pre�o m�dio

--usando HAVING
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS [PRECO MEDIO]
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
HAVING AVG(PRECO_DE_LISTA) <= 10;
--vai mostrar embalagem e o pre�o m�dio	que s�o menores ou igauis a 10	

--A DE CIMA E A DE BAIXO V�O DAR O MSM RESULTADO, UMA USANDO HAVING E A OUTRA SUBQUERY

--usando subconsulta(subquery)
SELECT MEDIA_EMBALAGENS.EMBALAGEM, MEDIA_EMBALAGENS.[PRECO MEDIO]
FROM
(SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS [PRECO MEDIO]
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.[PRECO MEDIO] <= 10;
--vai mostrar embalagem e o pre�o m�dio	que s�o menores ou igauis a 10	
---------------------------------------------------------------------------------------------------------------------------------------
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

SELECT SC.CODIGO_DO_PRODUTO, SC.NOME_DO_PRODUTO, SC.QUANTIDADE_TOTAL
FROM
(SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO) SC
WHERE SC.QUANTIDADE_TOTAL > 394000 
ORDER BY SC.QUANTIDADE_TOTAL DESC;

--as duas v�o dar o msm resultado, uma usando HAVING  e a outra usando SUBQUERY
---------------------------------------------------------------------------------------------------------------------------------------
--lower
SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO FROM TABELA_DE_CLIENTES;
--upper
SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO, UPPER(NOME) AS NOME_MAIUSCULO FROM TABELA_DE_CLIENTES;
--concat
SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO, ' ', CEP) AS ENDERECO_COMPLETO 
FROM TABELA_DE_CLIENTES;

SELECT NOME, ENDERECO_1 + ' ' + BAIRRO + ' ' + CIDADE + ' ' + ESTADO + ' ' +  CEP AS ENDERECO_COMPLETO 
FROM TABELA_DE_CLIENTES;
--left
SELECT NOME_DO_PRODUTO, LEFT(NOME_DO_PRODUTO, 3) AS TRES_PRIMEIRO_CARACTERES FROM TABELA_DE_PRODUTOS;
--right
SELECT NOME_DO_PRODUTO, RIGHT(NOME_DO_PRODUTO, 3) AS TRES_PRIMEIRO_CARACTERES FROM TABELA_DE_PRODUTOS;
--replace
SELECT TAMANHO, REPLACE(TAMANHO, 'Litros', 'L') AS TAMANHO_MODIFICADO FROM TABELA_DE_PRODUTOS;
---------------------------------------------------------------------------------------------------------------------------------------
--getdate
SELECT GETDATE();
--dateadd
SELECT DATEADD(DAY, 2, GETDATE());
--dateadd
SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 2, GETDATE()) AS DATA_DAQUI_2_DIAS;
--dateadd
SELECT DATEADD(DAY, -2, GETDATE());
--datediff
SELECT DATEDIFF(DAY, '2023-02-18', '2023-02-23');
--getdate / datediff
SELECT GETDATE() AS HOJE, DATEDIFF(DAY, '2023-12-31', GETDATE()) AS DIAS_DESDE_O_FIM_DO_ANO;
--datepart
SELECT GETDATE() DATA_HOJE, DATEPART(DAY,GETDATE()) AS DIA_DE_HOJE;

SELECT NOME + ' nasceu em ' + 
DATENAME (WEEKDAY,DATA_DE_NASCIMENTO) + ',' +
DATENAME (DAY,DATA_DE_NASCIMENTO) + ' de ' +
DATENAME(MONTH, DATA_DE_NASCIMENTO) + ' de ' +
DATENAME(YEAR, DATA_DE_NASCIMENTO) AS DATA_EXTENSO
FROM TABELA_DE_CLIENTES;
---------------------------------------------------------------------------------------------------------------------------------------
--round
SELECT ROUND(3.4284891, 2);
--ceiling
SELECT CEILING(3.4893);
--floor
SELECT FLOOR(3.4893);
---------------------------------------------------------------------------------------------------------------------------------------
SELECT YEAR(DATA_VENDA) AS ANO, FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);
---------------------------------------------------------------------------------------------------------------------------------------
--convert (121 �2 um doz c�digos de convers�o, cada c�digo tem seu modelo de converter) , (o varchar com o n�mero � a quantidade de caracteres desejado)
SELECT CONVERT(VARCHAR(10), GETDATE(), 121);
SELECT CONVERT(VARCHAR(25), GETDATE(), 121);

SELECT * FROM TABELA_DE_CLIENTES;

SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 121) AS DATA_CONVERTIDA
FROM TABELA_DE_CLIENTES;

SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 106) AS DATA_CONVERTIDA
FROM TABELA_DE_CLIENTES;

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS;

SELECT NOME_DO_PRODUTO, CONCAT('O pre�o de lista �: ', PRECO_DE_LISTA) AS PRECO FROM TABELA_DE_PRODUTOS;

































