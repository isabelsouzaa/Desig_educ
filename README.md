# Índice de Desigualdade de Oportunidade (IOP)


Para o cálculo do Índice de Desigualdade de Oportunidade (IOP) educacional foram utilizados dados do ENEM em conjunto com os dados oriundos do Censo Escolar de 2009 a 2019. Ao unir essas duas bases atraves do código da escola, foi possível calcular o IOP utilizando as notas do ENEM de cada aluno e subdividir tal índice por tipo de escola, Privada, Pública e Pública integral. 

## ROTEIRO:

### Importação
- Extração dos microdados da prova do ENEM incluindo o questionário socioeconomico respondido por cada participante e suas respectivas notas nas áreas de Matemática, Linguagens e códigos, Ciências Humanas e Ciências da Natureza, dos anos de 2009 a 2019.
- Extração dos dados do Censo Escolar dos anos de 2009 a 2019.

### Tratamento
- Transformação das variáveis socieconomicas de texto para numérica, para a construção futura do IOP (base ENEM). **manip_p_IOP.do**
- Merge entre a base do ENEM e o Censo Escolar atraves da variável referente ao código da escola, informada OPCIONALMENTE entre os alunos inscritos no ENEM. 
- Classificação dos alunos oriundos de escolas Privadas, Públicas e Públicas integrais. **MERGE E DUMMY ESCOLAS.txt**
- Cálculo do índice de Desigualdade de Oportunidade geral por município, e por tipo de unidade educacional. **IOP MUNICIPAL.txt** 


