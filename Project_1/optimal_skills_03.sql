/*
PROPÓSITO DA ANÁLISE:
Criar um Índice de Relevância Competitiva (Optimal Score) para identificar as 25 tecnologias 
que oferecem o melhor retorno financeiro aliado à alta empregabilidade (volume de vagas) 
para Engenheiros de Dados em regime Home Office.

EXPLICAÇÃO DA MATEMÁTICA DO SCORE:
1. ln_demand_count: O uso do Logaritmo Natural (LN) serve para suavizar (normalizar) a escala 
   da contagem de vagas, impedindo que uma tecnologia ultra-comum (como SQL) esmague completamente 
   soluções de alto valor no ranking apenas pelo volume bruto.
2. optimal_score: Multiplica o salário mediano pelo volume total de vagas daquela skill e divide 
   por 1 milhão. O resultado é um indicador padronizado de ROI (Retorno sobre Investimento de Carreira). 
   Quanto maior o score, mais estratégico é dominar aquela ferramenta.
*/


SELECT
    sd.skills AS skill,  
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * COUNT(jpf.*))/1_000_000, 2) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id
INNER JOIN  skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
    optimal_score DESC
LIMIT 25;

/*
┌────────────┬───────────────┬─────────────────┬───────────────┐
│   skill    │ median_salary │ ln_demand_count │ optimal_score │
│  varchar   │    double     │     double      │    double     │
├────────────┼───────────────┼─────────────────┼───────────────┤
│ python     │      135000.0 │             7.0 │        152.96 │
│ sql        │      130000.0 │             7.0 │        146.64 │
│ aws        │      137320.0 │             6.7 │        107.52 │
│ spark      │      140000.0 │             6.2 │         70.42 │
│ azure      │      128000.0 │             6.2 │          60.8 │
│ snowflake  │      135500.0 │             6.1 │         59.35 │
│ airflow    │      150000.0 │             6.0 │          57.9 │
│ kafka      │      145000.0 │             5.7 │         42.34 │
│ java       │      135000.0 │             5.7 │         40.91 │
│ redshift   │      130000.0 │             5.6 │         35.62 │
│ terraform  │      184000.0 │             5.3 │         35.51 │
│ databricks │      132750.0 │             5.6 │         35.31 │
│ scala      │      137290.0 │             5.5 │         33.91 │
│ git        │      140000.0 │             5.3 │         29.12 │
│ hadoop     │      135000.0 │             5.3 │         26.73 │
│ gcp        │      136000.0 │             5.3 │         26.66 │
│ nosql      │      134415.0 │             5.3 │         25.94 │
│ kubernetes │      150500.0 │             5.0 │         22.12 │
│ pyspark    │      140000.0 │             5.0 │         21.28 │
│ docker     │      135000.0 │             5.0 │         19.44 │
│ tableau    │      115000.0 │             5.1 │         18.86 │
│ mongodb    │      135750.0 │             4.9 │         18.46 │
│ r          │      134775.0 │             4.9 │         17.93 │
│ github     │      135000.0 │             4.8 │         17.15 │
│ sql server │      120000.0 │             4.9 │         16.68 │
└────────────┴───────────────┴─────────────────┴───────────────┘


INSIGHTS DA ANÁLISE COMPORTAMENTAL DE MERCADO (TOP 25 - RELEVÂNCIA ÓTIMA):

1. A FUNDAÇÃO INABALÁVEL (PYTHON & SQL):
   Embora não tenham os maiores salários isolados da lista (US$ 135k e US$ 130k), Python e SQL 
   esmagam qualquer concorrência no 'optimal_score' (152.96 e 146.64). Isso acontece porque o volume 
   delas é gigantesco (ln_demand = 7.0). Elas provam que, para o mercado remoto, ter altíssima 
   disponibilidade de vagas compensa qualquer sutil diferença salarial. São o porto seguro do candidato.

2. O TOPO DE VALOR AGREGADO (TERRAFORM & INFRA AS CODE):
   O Terraform é o maior outlier positivo em termos de salário (US$ 184.000,00). Mesmo com uma 
   demanda menor (5.3), ele cravou o 11º lugar geral no score. Isso indica um insight valioso: 
   o mercado paga um prêmio altíssimo para Engenheiros de Dados que também dominam DevOps e sabem 
   provisionar infraestrutura na nuvem como código (IaC).

3. O CORE STACK DE ENGENHARIA RAIZ (AWS, SPARK & AIRFLOW):
   Logo abaixo da base (Python/SQL), o índice aponta o caminho real de especialização:
   - AWS lidera em nuvem (Score: 107.52), muito acima de Azure (60.8) e GCP (26.66).
   - Spark consolida-se como o motor de Big Data obrigatório (Score: 70.42).
   - Airflow (US$ 150k) e Kafka (US$ 145k) mostram que Orquestração e Streaming em tempo real 
     são as habilidades técnicas intermediárias mais valorizadas financeiramente.

4. ECOSSISTEMAS DE ARMAZENAMENTO MODERNO (SNOWFLAKE vs DATABRICKS):
   Snowflake (59.35) e Databricks (35.31) mostram um duelo interessante. O Snowflake pontua mais 
   alto no índice devido a um volume ligeiramente maior nas vagas com salário listado, mas ambos 
   rodam na mesma faixa salarial (US$ 132k - US$ 135k), mostrando que o mercado adotou o conceito 
   de Data Lakehouse em massa.

5. A IMPORTÂNCIA DAS FERRAMENTAS DE SUPORTE (GIT & DOCKER):
   A presença de Git (29.12), Kubernetes (22.12) e Docker (19.44) no Top 25 deixa um recado claro 
   para quem está estudando: Engenharia de Dados não é apenas escrever queries; é engenharia de 
   software aplicada. Saber versionar código e containerizar aplicações é um requisito de mercado.

DIRETRIZ ESTRATÉGICA PARA O PORTFÓLIO:
Este gráfico dita o roadmap perfeito. O foco nível 1 deve ser consolidar Python, SQL e AWS (Garantia 
de volume e entrada). O foco nível 2 (Especialização) deve migrar para Spark e Airflow para surfar a 
onda dos salários de US$ 140k+. O foco nível 3 (Diferencial) deve ser Terraform ou Kafka para atingir 
o teto financeiro do mercado internacional.
*/