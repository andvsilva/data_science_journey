# 🧮 Tarefas Avaliativas

## Tarefa 2: Precificação Imobiliária com ANOVA e Regressão Linear
**Professor:** João Gabriel de Moraes Souza

---

## 📊 Tarefa Integrada: Análise de Dados Imobiliários com ANOVA e Regressão Linear

Você é um analista de dados de uma empresa de consultoria especializada em inteligência imobiliária.  
Sua missão é extrair insights a partir do **Ames Housing Dataset**, com o objetivo de auxiliar a tomada de decisão estratégica sobre **precificação e valorização de imóveis**.

A tarefa está dividida em duas etapas complementares de análise estatística:

---

### I. Análise Exploratória e Comparativa com ANOVA

a) Escolha **duas a três variáveis categóricas** do conjunto de dados  
(ex.: tipo de bairro, presença de lareira, número de banheiros, qualidade do acabamento, etc.).

b) **Aplique a ANOVA** para verificar se há diferença significativa entre os preços médios de venda em relação às categorias dessas variáveis.

c) **Verifique os pressupostos da ANOVA** (normalidade dos resíduos, homocedasticidade), utilizando testes apropriados  
(ex.: *Shapiro-Wilk*, *Levene*, *Anderson-Darling*).

d) Caso os pressupostos **não sejam atendidos**, opte por uma abordagem robusta  
(ex.: *ANOVA de Welch*, *Kruskal-Wallis*, *Mann-Whitney* ou *Wilcoxon signed-rank*).

e) **Interprete os resultados para fins de tomada de decisão:**  
Quais características mais impactam o preço médio?  
Como isso pode orientar corretores ou investidores?

---

### II. Modelagem Preditiva com Regressão Linear

a) Escolha **quatro a seis variáveis explicativas**, sendo obrigatório incluir ao menos **uma variável contínua** e **uma categórica** (tratada via variáveis dummies).

b) Modele o **preço de venda** utilizando uma **Regressão Linear Múltipla**, sem considerar interações entre variáveis.  
Avalie a possibilidade de aplicar uma **transformação logarítmica** na variável dependente (e eventualmente nas explicativas contínuas), construindo, por exemplo, um modelo do tipo **log-log**, que permite uma interpretação percentual dos coeficientes.

c) Realize o **diagnóstico dos pressupostos do modelo**:

- **Linearidade** (visualização com gráficos);
- **Normalidade dos resíduos** (teste de *Shapiro-Wilk* ou *Anderson-Darling*);
- **Homoscedasticidade** (teste de *Breusch-Pagan* ou verificação visual);
- **Multicolinearidade** (usando o *VIF – Variance Inflation Factor*).

d) Caso algum pressuposto seja violado, aplique **correções apropriadas**, como:

- transformação logarítmica;
- exclusão de variáveis colineares;
- revisão da seleção de variáveis.

e) Apresente **métricas de desempenho do modelo ajustado**:  
**R²**, **RMSE** e **MAE**.  
Discuta o ajuste global e a capacidade preditiva.

f) **Interprete os coeficientes estimados:**  
No caso de modelo log-log, os coeficientes podem ser interpretados como **variações percentuais aproximadas no preço de venda para cada 1% de variação na variável explicativa**, mantendo as demais constantes.  
Destaque quais variáveis têm maior impacto na precificação e se esse impacto é estatisticamente significativo.

g) Por fim, elabore **recomendações práticas** com base no modelo estimado, indicando como certas características aumentam ou reduzem o valor esperado do imóvel.  

Exemplo:  
> “Casas com acabamento excelente tendem a ter, em média, um preço **X% maior** que casas com acabamento regular.”

---

