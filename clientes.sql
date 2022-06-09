-----------Scrip de migração de clientes----------
 select
       C.cpfcgc AS CNPJ_CPF,
       C.nome AS NOME,
       C.nome_fant AS NOME_FANTASIA,
       C.rgie AS INSCRICAO_ESTADUAL,
       C.insc_municipal AS INSCRICAO_MUNICIPAL,
       C.nomerua AS ENDERECO,
       C.numrua AS NUMERO,
       C.complemento AS COMPLEMENTO,
       C.bairro AS BAIRRO,
       C.cep AS CEP,
       (m.id_ibge || c.id_municipio) as MUNICIPIO,
       C.cidade,
       C.fone_com1 AS TELEFONE,
       C.email AS EMAIL
       from clifor C
       left join uf m on m.id = c.id_uf;