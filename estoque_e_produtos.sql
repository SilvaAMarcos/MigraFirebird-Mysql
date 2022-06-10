---- Select para Migrar Produtos e Estoques -----
select
    P.id as CODIGO,
    P.nome AS DESCRICAO,
    P.id AS REFERENCIA,
    'SEM MARCA' AS MARCA,
    'SEM SECAO' AS SECAO,
    'SEM GRUPO' AS GRUPO,
    P.ncm AS NCM,
    P.cest AS CEST,
    P.tipo_item AS TIPO_ITEM,
    P.ean13 AS CODIGO_BARRAS ,
    P.preco_venda1 AS PRECO_VENDA,
    P.preco_custo1 AS CUSTO,
    ((P.preco_venda1 - P.preco_custo1)/100)*100 AS MARGEM_LUCRO,
    E.quant_tot AS ESTOQUE,
    'SEM MINIMO' AS ESTOQUE_MINIMO,
    'SEM MAXIMO' AS ESTOQUE_MAXIMO,
    P.unidade AS UNIDADE,
    P.origem AS ORIGEM,

    (SELECT T.id_cfop_dentro FROM TRIB_PROD T WHERE T.id = P.st) as CFOP_SAIDA,
    (SELECT T.cst_nfce FROM TRIB_PROD T WHERE T.id = P.st) AS CST_ICMS,
    '0' AS ALIQUOTA_ICMS,
    '0' as REDUCAO_BASE_ICMS,
    (SELECT T.cst_nfce FROM TRIB_PROD T WHERE T.id = P.st) AS CST_ICMS_NFCE,
    '0' AS ALIQUOTA_ICMS_NFCE,
    '0' AS REDUCAO_BASE_ICMS_NFCE,
    (SELECT T.id_cfop_dentro FROM TRIB_PROD T WHERE T.id = P.st) AS CFOP_NFCE,
    P.cst_ipi AS CST_IPI,
    '0' AS ALIQUOTA_IPI,
    '99' AS CST_PIS,
    '0' AS ALIQUOTA_PIS,
    '99' AS CST_COFINS,
    '0' AS ALIQUOTA_COFINS,
    '0' AS ALIQUOTA_DIFERIMENTO,
    '8.82' AS ALOQUOTA_SIMPLES_NACIONAL
from produto P
join estoque E on P.id = E.id_produto

-- WHERE P.id ='70038'

;

-- select * from produto;
-- select * from trib_icms_nfiscal_item