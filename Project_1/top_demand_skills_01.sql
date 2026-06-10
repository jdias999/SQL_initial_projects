/*
PROPÓSITO DA ANÁLISE:
Identificar as skills mais requisitadas pelo mercado global para Engenheiros de Dados 
que atuam especificamente no modelo remoto

POR QUE ESSA ANÁLISE É IMPORTANTE?
Mapeia a real necessidade técnica das empresas que contratam sem barreiras geográficas. Ao cruzar 
a tabela job_postings_fact com a tabela skills_job_dim, isolamos o volume de contratação (COUNT) 
de cada tecnologia, servindo como um guia estratégico de estudo e direcionamento de carreira 
para quem busca vagas de Engenharia de Dados 100% remotas.
*/
SELECT
    sd.skills AS skill,
    COUNT(jpf.*) AS count_skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id
INNER JOIN  skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
GROUP BY
    sd.skills
ORDER BY
    count_skills DESC
LIMIT 10;

/*

INSIGHTS DA ANÁLISE DE DEMANDA (DATA ENGINEER - REMOTO):

1. A HEGEMONIA DA BASE DE DADOS (SQL & PYTHON):
   SQL (29.2k) e Python (28.7k) aparecem praticamente empatados no topo. Isso prova que, 
   antes de qualquer ferramenta da moda, a base do Engenheiro de Dados é saber 
   manipular dados e construir pipelines. São skills obrigatórias.

2. A NUVEM (AWS,AZURE e GCP):
   A AWS lidera com folga (17.8k), mantendo o maior market share do mercado remoto. No entanto, 
   a Azure se consolida como uma força gigante logo atrás (14.1k), muito impulsionada pela 
   sua forte adoção no mundo corporativo tradicional. A GCP (6.4k) fecha o top 10, correndo 
   por fora.

3. O ECOSSISTEMA DE BIG DATA E ORQUESTRAÇÃO:
   Spark (12.7k) mostra que processamento de grandes volumes de dados (Big Data) em paralelo 
   é um requisito massivo para vagas remotas. Para amarrar tudo isso, o Airflow (9.9k) se 
   destaca como o orquestrador padrão da indústria.

4. PLATAFORMAS MODERNAS DE DATA WAREHOUSE:
   Snowflake (8.6k) e Databricks (8.1k) aparecem colados. Isso reflete a tendência atual das 
   empresas de migrarem suas arquiteturas para soluções "Lakehouse" e storages analíticos 
   gerenciados na nuvem.

CONCLUSÃO E DIRECIONAMENTO DE CARREIRA:
Para um Engenheiro de Dados se posicionar competitivamente para vagas Home Office, o foco inicial 
deve ser a trindade: SQL + Python + AWS, seguido de perto por conceitos de Spark e Airflow. 
Este Top 10 define o "Core Stack" ideal para guiar os planos de estudo e projetos de portfólio.

┌────────────┬──────────────┐
│   skill    │ count_skills │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────|
*/
