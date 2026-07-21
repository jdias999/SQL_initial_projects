
#  Portfólio de Engenharia de Dados: Análise e Pipeline ETL

Este repositório consolida dois projetos fundamentais desenvolvidos para demonstrar minhas habilidades práticas em manipulação, análise e arquitetura de dados usando SQL. O objetivo deste portfólio é evidenciar meu domínio em conceitos essenciais para vagas de **estágio em Engenharia de Dados ou Ciência de Dados**.

---

##  Visão Geral dos Projetos

Os projetos estão divididos em duas etapas principais que simulam um fluxo de trabalho real de dados: primeiro a extração de *insights* de negócio, e em seguida, a construção da infraestrutura robusta que suporta essas análises.

###  Projeto 1: Análise Exploratória de Dados (Data Analytics)
Focado na extração de inteligência a partir de dados brutos. Utilizando SQL avançado, o objetivo foi responder perguntas críticas de negócio sobre o mercado de trabalho de dados.

*   **Objetivo:** Identificar habilidades de alta demanda, mapear tendências salariais e descobrir a combinação ideal de competências para diferentes cargos.
*   **Habilidades Demonstradas:** Joins complexos, agregações, funções de janela (window functions) e filtragem de dados.
*    [Ver detalhes do Projeto 1](./Project_1/README.md)

###  Projeto 2: Construção de Data Warehouse & Data Marts (ETL Pipeline)
Focado na engenharia estrutural. Desenvolvi um pipeline ETL de ponta a ponta que transforma dados brutos não estruturados (CSVs do Google Cloud Storage) em um ambiente analítico de alta performance.

*   **Objetivo:** Criar uma fonte única de verdade (*single source of truth*) através de um Data Warehouse em *star schema*, além de construir Data Marts específicos (Flat, Skills e Priority) para agilizar consultas do time de negócios.
*   **Habilidades Demonstradas:** Modelagem dimensional (fato/dimensão), extração e transformação (ETL), tratamento de datas, limpeza de dados (Data Cleaning), chaves substitutas e operações de *upsert* (MERGE).
*    [Ver detalhes do Projeto 2](./Project_2/README.md)

---

##  Tecnologias Utilizadas

*   **SQL:** Linguagem principal para manipulação (DML) e definição (DDL) dos dados em ambos os projetos.
*   **DuckDB:** Motor de banco de dados OLAP utilizado pela sua eficiência e integração direta com arquivos na nuvem.
*   **Google Cloud Storage (GCS):** Armazenamento em nuvem dos dados brutos consumidos pelo pipeline do Projeto 2.

> ** Meu Foco Profissional:** Como estudante de Análise e Desenvolvimento de Sistemas, estruturei este repositório não apenas para gerar resultados, mas para mostrar *como* os resultados são construídos de forma escalável e com boas práticas de governança.
