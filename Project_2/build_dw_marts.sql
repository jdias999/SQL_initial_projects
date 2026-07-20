
--duckdb dw_marts.duckdb -c ".read build_dw_marts.sql"

-- Primeiro passo, criando o star schema
.read 01_create_tables_dw.sql

--Aqui, pegando os arquivos csv e insert nas tables
.read 02_load_schema_dw.sql

--Agora, pegando os arquivos do flat mart
.read 03_create_flat_mart.sql

--Agora, pegando os arquivos do skills mart
.read 04_create_skills_mart.sql

--Agora, pegando o priority mart
.read 05_create_priority_mart.sql

--Aora, pegando o update do priority mart
.read 06_update_priority_mart.sql