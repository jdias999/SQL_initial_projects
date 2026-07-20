#  Construção de Data Warehouse & Data Marts: Pipeline ETL em Produção

Um projeto de engenharia de dados que transforma arquivos CSV armazenados no Google Cloud Storage em um Data Warehouse modelado em **Star Schema** e, a partir dele, cria **Data Marts** para análises específicas.

> ** Objetivo Profissional**
> Este projeto foi desenvolvido para colocar em prática conceitos de Engenharia de Dados estudados durante minha graduação em Análise e Desenvolvimento de Sistemas. Meu objetivo é demonstrar conhecimentos em SQL, modelagem de dados e processos ETL para oportunidades de **estágio em Engenharia de Dados ou Análise de Dados**.

---

#  Resumo Executivo

-  Construção de um pipeline ETL completo, desde arquivos CSV até um Data Warehouse.
-  Modelagem de dados utilizando **Star Schema** (tabela fato e dimensões).
-  Transformação e limpeza dos dados antes do carregamento.
-  Criação de Data Marts voltados para diferentes tipos de análise.
-  Organização do projeto em scripts SQL separados para facilitar manutenção e execução.

---

#  Problema

Os dados chegam em arquivos CSV armazenados no Google Cloud Storage. Embora sejam fáceis de armazenar, esse formato não é o ideal para realizar análises, principalmente quando os dados começam a crescer.

Algumas perguntas que poderiam ser respondidas com esses dados são:

- Quais habilidades aparecem com mais frequência nas vagas?
- Quais empresas estão contratando mais?
- Como os salários variam entre cargos e tecnologias?
- Como a demanda por determinadas habilidades muda ao longo do tempo?

Para responder essas perguntas de forma organizada, foi criado um **Data Warehouse** como fonte principal dos dados e, a partir dele, diferentes **Data Marts** voltados para análises específicas.

---

#  Tecnologias Utilizadas

-  **DuckDB**
-  **SQL**
-  **Modelagem Star Schema**
-  **Google Cloud Storage**
-  **VS Code**
-  **DuckDB CLI**
-  **Git e GitHub**

---

#  Estrutura do Projeto

```text
2_WH_Mart_Build/
├── 01_create_tables_dw.sql
├── 02_load_schema_dw.sql
├── 03_create_flat_mart.sql
├── 04_create_skills_mart.sql
├── 05_create_priority_mart.sql
├── 06_update_priority_mart.sql
├── 07_create_company_mart.sql
├── build_dw_marts.sql
└── README.md
```

---

#  Arquitetura do Pipeline

O pipeline lê arquivos CSV do Google Cloud Storage, transforma os dados, carrega tudo em um Data Warehouse e depois gera Data Marts que podem ser utilizados por ferramentas como Power BI, Excel, Tableau ou Python.

## 1. Data Warehouse

O Data Warehouse foi construído utilizando **Star Schema**, separando os dados em tabelas fato e dimensões.

Principais tabelas:

- `job_postings_fact`
- `company_dim`
- `skills_dim`
- `skills_job_dim`

**Objetivo**

Centralizar os dados em uma estrutura organizada para servir como base das análises.

**Granularidade**

Uma linha representa uma vaga de emprego.

---

## 2. Flat Mart

Tabela desnormalizada contendo praticamente todas as informações já unidas.

**Objetivo**

Facilitar consultas rápidas sem precisar escrever vários JOINs.

**Granularidade**

Uma linha por vaga.

---

## 3. Skills Mart

Data Mart focado na análise da demanda por habilidades ao longo do tempo.

**Objetivo**

Permitir análises como:

- tecnologias mais procuradas;
- evolução da demanda por habilidade;
- habilidades por cargo.

**Granularidade**

`skill_id + mês + cargo`

---

## 4. Priority Mart

Data Mart criado para acompanhar vagas consideradas prioritárias.

**Objetivo**

Mostrar apenas os cargos de interesse e manter essas informações atualizadas.

**Destaque**

Utiliza **MERGE** para atualizar os dados sem precisar recriar toda a tabela.

---

## 5. Company Mart

Data Mart voltado para análises de contratação das empresas.

**Objetivo**

Mostrar indicadores como:

- quantidade de vagas;
- empresas que mais contratam;
- locais com mais oportunidades.

---

#  Conhecimentos Demonstrados

## Pipeline ETL

### Extração

- Leitura de arquivos CSV diretamente do Google Cloud Storage.
- Utilização da extensão `httpfs` do DuckDB.

### Transformação

- Limpeza dos dados.
- Conversão de tipos de dados.
- Tratamento de datas.
- Padronização de informações.
- Remoção de registros inválidos.

### Carga

- Inserção dos dados nas tabelas do Data Warehouse.
- Scripts preparados para que o pipeline possa ser executado novamente sempre que necessário.

### Organização

- Um script principal executa todas as etapas do pipeline em sequência.

---

## Modelagem de Dados

- Construção de um **Star Schema**.
- Separação entre tabela fato e tabelas dimensão.
- Utilização de tabelas de relacionamento para resolver relações muitos-para-muitos.
- Definição da granularidade das tabelas.
- Criação de chaves substitutas para identificação dos registros.

---

## SQL

Durante o projeto foram utilizados recursos como:

- CREATE TABLE
- INSERT INTO
- SELECT
- JOIN
- LEFT JOIN
- CTEs (`WITH`)
- GROUP BY
- ORDER BY
- CASE
- CAST
- DATE_TRUNC
- EXTRACT
- STRING_AGG
- MERGE

---

## Boas Práticas

- Organização do projeto em scripts separados.
- Estrutura simples para facilitar manutenção.
- Separação entre Data Warehouse e Data Marts.
- Código reutilizável e fácil de executar novamente.
- Tipagem correta das colunas (`INTEGER`, `VARCHAR`, `DOUBLE`, `TIMESTAMP`).
- Projeto versionado utilizando Git e GitHub.