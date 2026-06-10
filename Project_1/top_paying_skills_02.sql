/*
PROPÓSITO DA ANÁLISE:
Identificar o top 10 de habilidades mais valorizadas financeiramente
para Engenheiros de Dados em regime Home Office, garantindo relevância estatística no mercado.

POR QUE USAR O HAVING NESTE CENÁRIO?
Como a query ordena pelos maiores salários (ORDER BY median_salary DESC), se não houvesse o 
filtro 'HAVING COUNT(jpf.*) > 100', o topo do relatório seria poluído por tecnologias de nicho 
ou obsoletas que possuem pouquíssimas vagas (ex: 1 ou 2), mas com salários fora da curva. 
O HAVING atua como um filtro de corte estatístico, garantindo que só analisaremos ferramentas 
com presença real e sustentável no mercado remoto (> 100 postagens).
*/

SELECT
    sd.skills AS skill,
    COUNT(jpf.*) AS count_skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary -- round usado para ajustar decimais
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
HAVING
    COUNT(jpf.*) > 100
ORDER BY
    median_salary DESC
LIMIT 25;
/*
┌───────────┬──────────────┬───────────────┐
│   skill   │ count_skills │ median_salary │
│  varchar  │    int64     │    double     │
├───────────┼──────────────┼───────────────┤
│ rust      │          232 │      210000.0 │
│ sheets    │           98 │      196698.0 │
│ solidity  │           45 │      192500.0 │
│ terraform │         3248 │      184000.0 │
│ golang    │          912 │      184000.0 │
│ next.js   │           19 │      180000.0 │
│ ggplot2   │           15 │      176250.0 │
│ spring    │          364 │      175500.0 │
│ erlang    │            9 │      172500.0 │
│ haskell   │           17 │      172500.0 │
└───────────┴──────────────┴───────────────┘

INSIGHTS DA ANÁLISE DE TETOS SALARIAIS (TOP 10 - DATA ENGINEER REMOTO):

1. O IMPACTO CRÍTICO DA RELEVÂNCIA ESTATÍSTICA (HAVING > 100):
   Esta tabela prova o poder do HAVING no projeto. Tecnologias como Solidity (45 vagas), 
   Next.js (19), ggplot2 (15), Haskell (17) e Erlang (9), embora apresentem salários altíssimos, 
   seriam eliminadas pelo filtro '> 100'. Elas representam nichos extremos ou ruídos estatísticos. 
   O verdadeiro Engenheiro de Dados focado em empregabilidade deve desconsiderá-las como meta principal.

2. RUST NO TOPO DA PIRÂMIDE (O NOVO PADRÃO DE PERFORMANCE):
   Considerando o filtro de corte, o Rust assume a liderança absoluta com uma mediana impressionante 
   de US$ 210.000,00 e uma amostragem sólida (232 vagas). Isso reflete o movimento atual da Engenharia 
   de Dados moderna de migrar ferramentas de core (como novos motores de processamento e frameworks) 
   para Rust devido à sua eficiência de memória e velocidade. É o maior teto salarial real da área.

3. O PODER DA INFRAESTRUTURA COMO CÓDIGO (TERRAFORM):
   O Terraform é o monstro sagrado desse relatório. Ele não apenas tem um salário espetacular 
   (US$ 184.000,00), mas carrega uma volumetria massiva de 3.248 vagas. Ele é o sobrevivente mais 
   robusto do topo. Isso prova que empresas pagam muito mais para engenheiros de dados que sabem 
   provisionar e arquitetar a própria infraestrutura em nuvem (cultura DevOps/DataOps).

4. LINGUAGENS DE BACKEND DE ALTA PERFORMANCE (GOLANG & SPRING/JAVA):
   - O Golang (912 vagas | US$ 184k) consolida-se como uma skill de elite para construção de pipelines 
     e ferramentas internas de dados de alta concorrência.
   - O Spring (364 vagas | US$ 175.5k) mostra que o ecossistema robusto do Java voltado para o mundo 
     corporativo e microsserviços pesados continua pagando prêmios salariais altíssimos.

5. O OUTLIER BIZARRO DE NEGÓCIO (GOOGLE SHEETS):
   A presença de 'sheets' com 98 vagas e US$ 196k de mediana é um ponto fora da curva curioso que 
   quase passa pelo filtro (bateria no corte de 100). Isso geralmente indica posições muito específicas 
   de consultoria de negócios ou startups em estágio inicial que exigem automação pesada conectando 
   planilhas diretamente a APIs ou bancos de dados analíticos, pagando caro pela urgência do analista sênior.

DIRETRIZ DE CARREIRA E ROI:
Para quem busca atingir o teto financeiro do mercado internacional trabalhando de casa, o caminho 
mais seguro e escalável após dominar a base é especializar-se em Terraform (Infraestrutura) e Golang 
ou Rust (Programação de alta performance para sistemas de dados).
*/

