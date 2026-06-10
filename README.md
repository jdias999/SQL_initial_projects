# Data Engineering Market Fit: Mapeando o Mercado Remoto

##  O Objetivo do Projeto
Com o crescimento exponencial da área de dados, o volume de ferramentas e tecnologias disponíveis pode ser esmagador. Como estudante de Análise e Desenvolvimento de Sistemas focado em ingressar no mercado de Engenharia de Dados, decidi parar de "achar" o que as empresas queriam e fui perguntar aos dados.

Este projeto analisa um dataset global de vagas de tecnologia para descobrir **quais habilidades oferecem o melhor custo-benefício (Empregabilidade vs. Retorno Financeiro)** para Engenheiros de Dados no modelo 100% Home Office.

##  Stack Tecnológica e Habilidades Aplicadas
- **Linguagem:** SQL
- **Banco de Dados:** DuckDB (Modelagem Relacional / Star Schema)
- **Técnicas Empregadas:** `JOINs` em cascata, Funções de Agregação, Filtros Estatísticos (`HAVING`), Criação de Métricas de Negócio (Matemática com Logaritmos).

---

##  A Lógica da Análise (As 3 Perguntas de Negócio)

Para não cair em falsas métricas, dividi a análise em três etapas lógicas, do mais geral para o mais específico:

### 1. O que o mercado mais exige? (Volume)
Primeiro, cruzei a tabela Fato de vagas com a Dimensão de habilidades para descobrir a demanda bruta.
* **Resultado:** **SQL** e **Python** dominam com folga. Elas não são diferenciais, são o alicerce obrigatório. Junto com elas, a nuvem da **AWS** lidera o volume de infraestrutura exigida.
* [ Ver código SQL da Análise de Volume](Project_1/top_demand_skills_01.sql)  2. Onde está o dinheiro? (Valor e Limpeza de Outliers)
Não adianta uma ferramenta pagar muito bem se ela só tem 3 vagas no mundo. Para descobrir o teto salarial *realista*, calculei a mediana salarial de cada tecnologia, mas apliquei uma **regra de negócio crucial**. Utilizei o filtro `HAVING COUNT > 100` para analisar apenas tecnologias com amostragem estatisticamente relevante.
* **Resultado:** Eliminando os ruídos, linguagens de altíssima performance (**Rust**, **Golang**) e ferramentas de infraestrutura como código (**Terraform**) dominaram o topo, com salários ultrapassando a faixa dos US$ 180k anuais.
* [ Ver código SQL da Análise de Salários](Project_1/top_paying_skills_02.sql)  3. Onde devo investir meu tempo de estudo? (Optimal Score)
A última etapa foi criar um algoritmo simples de recomendação para o meu próprio plano de estudos. Criei um **Índice de Relevância (Optimal Score)** que multiplica a mediana salarial pelo volume de vagas (normalizado através de Logaritmo Natural - `LN`).
* **Resultado:** O equilíbrio perfeito do mercado está no "Core Stack" de Engenharia: **Python, SQL, AWS, Spark e Airflow**. Elas unem abundância de vagas com excelente remuneração.
* [ Ver código SQL do Optimal Score](Project_1/optimal_skills_03.sql) ---

##  Principais Insights
1. **Ferramentas não superam fundamentos:** A infraestrutura e a linguagem importam mais que a ferramenta do momento. Saber provisionar infraestrutura (Terraform) ou lidar com fluxos contínuos de dados pesados vale ouro para o mercado remoto.
2. **Engenharia de Dados é Engenharia de Software:** A alta pontuação de ferramentas como Git e Docker nas vagas prova que versionamento e containerização são requisitos indispensáveis no dia a dia.
3. **Data Lakehouse é o presente:** A briga parelha entre Snowflake e Databricks mostra que as empresas já consolidaram a arquitetura de armazenamento moderno na nuvem.

##  Sobre Mim e Próximos Passos
Desenvolvi essa análise para guiar meus estudos e validar habilidades técnicas na prática. Meu foco principal agora é aplicar esse raciocínio lógico em um ambiente corporativo real. Estou em busca de uma oportunidade de **Estágio em Engenharia/Análise de Dados**, onde eu possa transformar dados brutos em inteligência de negócios e aprender a manter pipelines de produção.