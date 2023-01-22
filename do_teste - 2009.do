*** Análise dos Microdados Enem - 2009 - Todo Brasil ***


*** Matendo no Banco de dados as Variáveis abaixo ****
keep nu_inscricao nu_ano nu_idade tp_sexo co_municipio_residencia no_municipio_residencia co_uf_reside ///
ncia sg_uf_residencia tp_st_conclusao tp_ensino co_escola co_municipio_esc no_municipio_esc co_uf_esc  ///
sg_uf_esc tp_dependencia_adm_esc tp_localizacao_esc tp_sit_func_esc nu_nota_cn nu_nota_ch nu_nota_lc n ///
u_nota_mt tx_respostas_cn tx_respostas_ch tx_respostas_lc tx_respostas_mt q1 q2 q3 q17 q18 q19 q20 q21 ///
q25 q31


*** Sexo 0 - M; 1 - F ***
gen dSexo =.
replace dSexo = 0 if tp_sexo=="M"
replace dSexo = 1 if tp_sexo=="F"
tab dSexo, m

*** Tabulando Variável Sexo para Pernambuco ***
tab dSexo if co_uf_residencia==26, m

*** Localização da escola - 1-Urbano; 0-Rural ****
gen dlocalizacao = .
replace dlocalizacao = 1 if tp_localizacao_esc==1
replace dlocalizacao = 0 if tp_localizacao_esc==2
tab dlocalizacao, m

*** Tabulando Variável Localização para Pernambuco ***
tab dlocalizacao if co_uf_residencia==26, m

**** Escolaridade do Pai ****
gen EscolaridadePai = .
replace EscolaridadePai = 1 if q17=="A"
replace EscolaridadePai = 2 if q17=="B"
replace EscolaridadePai = 3 if q17=="C"
replace EscolaridadePai = 4 if q17=="D"
replace EscolaridadePai = 5 if q17=="E"
replace EscolaridadePai = 6 if q17=="F"
replace EscolaridadePai = 7 if q17=="G"
replace EscolaridadePai = 8 if q17=="H"
tab EscolaridadePai, m

*** Tabulando Variável Escolaridade do Pai para Pernambuco ***
tab EscolaridadePai if co_uf_residencia==26, m

**** Escolaridade do Mãe ****
gen EscolaridadeMae = .
replace EscolaridadeMae = 1 if q18=="A"
replace EscolaridadeMae = 2 if q18=="B"
replace EscolaridadeMae = 3 if q18=="C"
replace EscolaridadeMae = 4 if q18=="D"
replace EscolaridadeMae = 5 if q18=="E"
replace EscolaridadeMae = 6 if q18=="F"
replace EscolaridadeMae = 7 if q18=="G"
replace EscolaridadeMae = 8 if q18=="H"
tab EscolaridadeMae, m

*** Tabulando Variável Escolaridade do Mãe para Pernambuco ***
tab EscolaridadeMae if co_uf_residencia==26, m

*** Raça 0 - Nã0 Branco, 1 - Branco****
gen raca = .
replace raca = 1 if q3 == "A"
replace raca = 0 if q3 == "B"
replace raca = 0 if q3 == "C"
replace raca = 0 if q3 == "D"
replace raca = 0 if q3 == "E"
tab raca, m

*** Tabulando Variável Raça para Pernambuco ***
tab raca if co_uf_residencia==26, m

*** Renda familiar ***
*** Coloquei a Informação "sem renda (H)" como código ==1, pois é a condição mais baixa entre as rendas **
gen renda = .
replace renda = 1 if q21=="H"
replace renda = 2 if q21=="A"
replace renda = 3 if q21=="B"
replace renda = 4 if q21=="C"
replace renda = 5 if q21=="D"
replace renda = 6 if q21=="E"
replace renda = 7 if q21=="F"
replace renda = 8 if q21=="G"
tab renda, m

*** Tabulando Variável Renda para Pernambuco ***
tab renda if co_uf_residencia==26, m

*** Computadores ***
gen computador =.
replace computador = 0 if q25=="D"
replace computador = 1 if q25=="A"
replace computador = 1 if q25=="B"
replace computador = 1 if q25=="C"
tab computador, m

*** Tabulando Variável Escolaridade do Mãe para Pernambuco ***
tab computador if co_uf_residencia==26, m

*** renomeando as variáveis nota **
rename nu_nota_cn nota_cn 
rename nu_nota_ch nota_ch
rename nu_nota_lc nota_lc
rename nu_nota_mt nota_mt

**** Log dos Resultados ****
log using resultado2009, name(resultado2009) text

*** Gerando IOP para Ciências da Natureza em PERNAMBUCO  - co_uf_residencia==26 ****
iop nota_cn dSexo EscolaridadePai EscolaridadeMae dlocalizacao if co_uf_residencia==26, shapley(fg2r) 
iop nota_cn dSexo EscolaridadePai EscolaridadeMae renda raca dlocalizacao if co_uf_residencia==26, shapley(fg2r)
iop nota_cn dSexo EscolaridadePai EscolaridadeMae renda raca dlocalizacao if co_uf_residencia==26, shapley(fg2r)
iop nota_cn dSexo EscolaridadePai EscolaridadeMae raca computador dlocalizacao if co_uf_residencia==26, shapley(fg2r) 


iop nota_cn dSexo EscolaridadePai EscolaridadeMae dlocalizacao if co_municipio_residencia==2600054 
iop nota_cn dSexo EscolaridadePai EscolaridadeMae dlocalizacao if co_municipio_residencia==2600104
 iop nota_cn dSexo EscolaridadePai EscolaridadeMae dlocalizacao if co_municipio_residencia==2600203






