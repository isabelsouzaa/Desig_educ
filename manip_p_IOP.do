*** Análise dos Microdados Enem - 2012 - Todo Brasil ***


*** Mantendo no Banco de dados as Variáveis abaixo ****
keep nu_inscricao nu_ano idade tp_sexo cod_municipio_insc no_municipio_insc uf_insc st_conclusao ano_concluiu tp_escola in_tp_ensino tp_estado_civil tp_cor_raca pk_cod_entidade cod_municipio_esc no_municipio_esc uf_esc id_dependencia_adm id_localizacao sit_func nu_nt_cn nu_nt_ch nu_nt_lc nu_nt_mt q01 q02 q03 q04 q10 q17

*** Sexo 0 - M; 1 - F ***
gen dSexo =.
replace dSexo = 0 if tp_sexo==0
replace dSexo = 1 if tp_sexo==1
tab dSexo, m

*** Tabulando Variável Sexo para Pernambuco ***
tab dSexo if co_uf_residencia==26, m

*** Localização da escola - 1-Urbano; 0-Rural ****
gen dlocalizacao = .
replace dlocalizacao = 1 if id_localizacao==1
replace dlocalizacao = 0 if id_localizacao==2
tab dlocalizacao, m

*** Tabulando Variável Localização para Pernambuco ***
tab dlocalizacao if cod_municipio_insc>= 2600000 & cod_municipio_insc<2700000 , m

**** Escolaridade do Pai ****

gen EscolaridadePai = .
replace EscolaridadePai = 1 if q01=="A"
replace EscolaridadePai = 2 if q01=="B"
replace EscolaridadePai = 3 if q01=="C"
replace EscolaridadePai = 4 if q01=="D"
replace EscolaridadePai = 5 if q01=="E"
replace EscolaridadePai = 6 if q01=="F"
replace EscolaridadePai = 7 if q01=="G"
replace EscolaridadePai = 8 if q01=="H"
tab EscolaridadePai, m
*** Tabulando Variável Escolaridade do Pai para Pernambuco ***
tab EscolaridadePai if co_uf_residencia==26, m

**** Escolaridade do Mãe ****
gen EscolaridadeMae = .
replace EscolaridadeMae = 1 if q02=="A"
replace EscolaridadeMae = 2 if q02=="B"
replace EscolaridadeMae = 3 if q02=="C"
replace EscolaridadeMae = 4 if q02=="D"
replace EscolaridadeMae = 5 if q02=="E"
replace EscolaridadeMae = 6 if q02=="F"
replace EscolaridadeMae = 7 if q02=="G"
replace EscolaridadeMae = 8 if q02=="H"
tab EscolaridadeMae, m

*** Tabulando Variável Escolaridade do Mãe para Pernambuco ***
tab EscolaridadeMae if co_uf_residencia==26, m

*** Raça 0 - Nã0 Branco, 1 - Branco****
gen raca = .
replace raca = 1 if tp_cor_raca == 1
replace raca = 0 if tp_cor_raca == 2
replace raca = 0 if tp_cor_raca == 3
replace raca = 0 if tp_cor_raca == 4
replace raca = 0 if tp_cor_raca == 5
tab raca, m

*** Tabulando Variável Raça para Pernambuco ***
tab raca if co_uf_residencia==26, m

*** Renda familiar ***
*** Coloquei a Informação "sem renda (H)" como código ==1, pois é a condição mais baixa entre as rendas **
gen renda = .
replace renda = 1 if q03=="A"
replace renda = 2 if q03=="B"
replace renda = 3 if q03=="C"
replace renda = 4 if q03=="D"
replace renda = 5 if q03=="E"
replace renda = 6 if q03=="F"
replace renda = 7 if q03=="G"
replace renda = 8 if q03=="H"
replace renda = 9 if q03=="I"
replace renda = 10 if q03=="J"
replace renda = 11 if q03=="K"
replace renda = 12 if q03=="L"
replace renda = 13 if q03=="M"
replace renda = 14 if q03=="N"
replace renda = 15 if q03=="O"
replace renda = 16 if q03=="P"
replace renda = 17 if q03=="Q"
tab renda, m

*** Tabulando Variável Renda para Pernambuco ***
tab renda if co_uf_residencia==26, m

*** Computadores ***
gen computador =.
replace computador = 0 if q10=="D"
replace computador = 1 if q10=="A"
replace computador = 1 if q10=="B"
replace computador = 1 if q10=="C"
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








