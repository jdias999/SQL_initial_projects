
--duckdb dw_marts.duckdb -c ".read build_dw_marts.sql"

-- Primeiro passo, criando o star schema
.read 01_create_tables_dw.sql

--Aqui, pegando os arquivos csv e insert nas tables

.read 02_load_schema_dw.sql