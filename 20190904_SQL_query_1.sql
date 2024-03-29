/****** Script do comando SelectTopNRows de SSMS  ******/

--SAFRA = ANO-MESC

--SELECT [SAFRA_CADASTRO], COUNT(SAFRA_CADASTRO) AS CONTAGEM
--FROM (



--SELECT DISTINCT ([QTD_CHAR_TELEFONE_RESID_TRATADO]) FROM (
	SELECT TOP (1000) 
		   [IDCLIENTETITULARPESSOAFISICA]=RTRIM(LTRIM([IDCLIENTETITULARPESSOAFISICA]))
		  ,[DATACADASTRO]
		  ,[DATACADASTRO_TRATADO]=CONVERT(DATE,[DATACADASTRO],101)
		  ,[ANO_DATACADASTRO]=YEAR(CONVERT(DATE,[DATACADASTRO],101))
		  ,[MES_DATACADASTRO]=MONTH(CONVERT(DATE,[DATACADASTRO],101))
		  ,[MES_DATACADASTRO_TRATADO] = CASE WHEN LEN( CONVERT(CHAR, MONTH(CONVERT(DATE,[DATACADASTRO],101)))) = 1 THEN '0'+ CONVERT(CHAR, MONTH(CONVERT(DATE,[DATACADASTRO],101)))
											 ELSE CONVERT (CHAR, MONTH (CONVERT(DATE,[DATACADASTRO],101)))
										END
		  ,[SAFRA_CADASTRO]=LTRIM(RTRIM(CONVERT(CHAR,YEAR(CONVERT(DATE,[DATACADASTRO],101)))))+CONVERT(CHAR,CASE WHEN LEN( CONVERT(CHAR, MONTH(CONVERT(DATE,[DATACADASTRO],101)))) = 1 THEN '0'+''+CONVERT(CHAR, MONTH(CONVERT(DATE,[DATACADASTRO],101)))
											 ELSE CONVERT (CHAR, MONTH (CONVERT(DATE,[DATACADASTRO],101)))
										END)
		  ,[SAFRA_CADASTRO_TRATADO]=CONVERT(INT,LTRIM(RTRIM(CONVERT(CHAR,YEAR(CONVERT(DATE,[DATACADASTRO],101)))))+CONVERT(CHAR,CASE WHEN LEN( CONVERT(CHAR, MONTH(CONVERT(DATE,[DATACADASTRO],101)))) = 1 THEN '0'+''+CONVERT(CHAR, MONTH(CONVERT(DATE,[DATACADASTRO],101)))
											 ELSE CONVERT (CHAR, MONTH (CONVERT(DATE,[DATACADASTRO],101)))
										END))
		  ,[TELEFONE_RESIDENCIAL]

		  ,[DDD_TELEFONE_RESIDENCIAL]=	CASE 
											WHEN [TELEFONE_RESIDENCIAL] ='-' THEN NULL 
											WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) != '(' THEN SUBSTRING([TELEFONE_RESIDENCIAL],2,2)
											ELSE NULL
										END
		  ,[TELEFONE_RESIDENCIAL_TRATADO]=	CASE --()988087678 REPLACE([VARIAVEL], ')','') -> TIROU O PARENTESE
												 --(16)988087678
												WHEN [TELEFONE_RESIDENCIAL] = '-' THEN NULL 
												WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 13 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,9)
												WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 12 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,8)
												WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 11 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,9)
												WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 10 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,8)
												ELSE 'ERRO'
											END
		  ,[QTD_CHAR_TELEFONE_RESID_TRATADO]=	LEN(CASE 
														WHEN [TELEFONE_RESIDENCIAL] = '-' THEN NULL 
														WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 13 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,9)
														WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 12 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,8)
														WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 11 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,9)
														WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 10 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,8)
														ELSE 'ERRO'
													END)
		  ,[FLAG_DECLAROU_NUM_TEL_RESIDENCIAL]=	CASE 
													WHEN	LEN(CASE 
																WHEN [TELEFONE_RESIDENCIAL] = '-' THEN NULL 
																WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 13 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,9)
																WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 12 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,8)
																WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 11 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,9)
																WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 10 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,8)
																ELSE 'ERRO'
															END) IN (8,9) 
													THEN 1
													ELSE 0
												END
		  ,[TIPO_TELEFONE_RESID_DECLARADO]= CASE 
												WHEN LEN(CASE 
															WHEN [TELEFONE_RESIDENCIAL] = '-' THEN NULL 
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 13 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,9)
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 12 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,8)
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 11 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,9)
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 10 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,8)
															ELSE 'ERRO'
														 END) = 8 THEN 'RESIDENCIAL'
														 WHEN LEN(CASE 
															WHEN [TELEFONE_RESIDENCIAL] = '-' THEN NULL 
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 13 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,9)
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],4,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 12 THEN SUBSTRING([TELEFONE_RESIDENCIAL],5,8)
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 11 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,9)
															WHEN SUBSTRING([TELEFONE_RESIDENCIAL],2,1) = ')' AND LEN([TELEFONE_RESIDENCIAL]) = 10 THEN SUBSTRING([TELEFONE_RESIDENCIAL],3,8)
															ELSE 'ERRO'
															END) = 9 THEN 'CELULAR'
														ELSE NULL
											END
		  ,[TELEFONE_CELULAR]
		  ,[TELEFONE_COMERCIAL]
		  ,[ESCOLARIDADE]
		  ,[DATANASCIMENTO]
		  ,[CEP]
		  ,[ESTADO]
		  ,[RENDA]
		  ,[PROFISSAO]
		  ,[ESTADOCIVIL]
		  ,[TIPOMORADIA]
		  ,[LIMITE TOTAL]
		  ,[LIMITE DISPONÍVEL]
	  FROM [RISK_SCORE].[dbo].[base_cadastro]
  --)A

--GROUP BY SAFRA_CADASTRO
--ORDER BY SAFRA_CADASTRO
