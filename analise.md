# Dados da Bundesliga 2023/2024
## Análise

**1.** Qual equipe teve o maior número de vitórias ?

````sql
SELECT TOP (1) 
       Equipe, 
       MAX(Vitorias) AS Max_Vitórias
FROM bundesliga
GROUP BY Equipe
ORDER BY Max_Vitórias DESC
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Max_Vitórias</th></tr>
<tr><td>Leverkusen</td><td>28</td></tr>
</table>

------

**2.** Quais as equipes classificadas para a UEFA Champions League da próxima temporada ?

````sql
SELECT TOP (5) 
       Classificacao, 
       Equipe, 
       Notas
FROM bundesliga
ORDER BY Classificacao ASC
GO
````
**Resultado:**
<table>
<tr><th>Classificacao</th><th>Equipe</th><th>Notas</th></tr>
<tr><td>1</td><td>Leverkusen</td><td>→ Champions League via colocação na liga</td></tr>
<tr><td>2</td><td>Stuttgart</td><td>→ Champions League via colocação na liga</td></tr>
<tr><td>3</td><td>Bayern Munich</td><td>→ Champions League via colocação na liga</td></tr>
<tr><td>4</td><td>RB Leipzig</td><td>→ Champions League via colocação na liga</td></tr>
<tr><td>5</td><td>Dortmund</td><td>→ Champions League via colocação na liga</td></tr>
</table>

------

 **3.** Quais equipes com aproveitamento maior ou igual a 70% ?
 
 ````sql
SELECT 
       Equipe, 
       Percentual_aproveitamento
FROM bundesliga
WHERE Percentual_aproveitamento >= 70
ORDER BY Percentual_aproveitamento DESC
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Percentual_aproveitamento</th></tr>
<tr><td>Leverkusen</td><td>88,2</td></tr>
<tr><td>Stuttgart</td><td>71,6</td></tr>
<tr><td>Bayern Munich</td><td>70,6</td></tr>
</table>

------



 **4.** Qual equipe com maior número de cartões vermelhos ?
 
 ````sql
SELECT TOP (1) 
       Equipe, 
       SUM(Crts_V) AS Total_Cartoes_Vermelhos
FROM bundesliga
GROUP BY Equipe
ORDER BY Total_Cartoes_Vermelhos DESC
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Total_Cartoes_Vermelhos</th></tr>
<tr><td>Union Berlin</td><td>7</td></tr>
</table>


------

 **5.** Qual a média de público total do campeonato ?
 
 ````sql
SELECT 
       CAST(AVG(Publico) AS DECIMAL(10, 3)) AS Média_Campeonato
FROM bundesliga
GO
````
**Resultado:**
<table>
<tr><th>Média_Campeonato</th></tr>
<tr><td>39.476</td></tr>
</table>


------


 **6.** Qual é a equipe que tem a maior melhoria em termos de diferença de gols esperada em comparação com a diferença de gols real?
 
 ````sql
SELECT 
       Equipe, 
       (Diferenca_gols - Diferenca_gols_esperada) AS Melhoria_Diferenca_Gols
FROM bundesliga
ORDER BY Melhoria_Diferenca_Gols DESC
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Melhoria_Diferenca_Gols</th></tr>
<tr><td>Leverkusen</td><td>21,3</td></tr>
<tr><td>Heidenheim</td><td>17,5</td></tr>
<tr><td>Dortmund</td><td>13,5</td></tr>
<tr><td>RB Leipzig</td><td>12,5</td></tr>
<tr><td>Hoffenheim</td><td>7,2</td></tr>
<tr><td>Eint Frankfurt</td><td>6,9</td></tr>
<tr><td>Stuttgart</td><td>6,3</td></tr>
<tr><td>Werder Bremen</td><td>3,6</td></tr>
<tr><td>Augsburg</td><td>1,3</td></tr>
<tr><td>Gladbach</td><td>-3,2</td></tr>
<tr><td>Bayern Munich</td><td>-4</td></tr>
<tr><td>Köln</td><td>-6,7</td></tr>
<tr><td>Wolfsburg</td><td>-9,5</td></tr>
<tr><td>Freiburg</td><td>-11,9</td></tr>
<tr><td>Mainz 05</td><td>-12,2</td></tr>
<tr><td>Bochum</td><td>-12,7</td></tr>
<tr><td>Union Berlin</td><td>-14,6</td></tr>
<tr><td>Darmstadt 98</td><td>-15,2</td></tr>
</table>


------


 **7.** Quais equipes têm uma alta taxa de conversão de posse de bola em gols, considerando a razão entre gols marcados e posse de bola?
 
 ````sql
SELECT 
       Equipe, 
       CAST((Gols_Por / Posse_Bola) AS DECIMAL(10,2)) AS Conversao_Posse_Gols
FROM bundesliga
ORDER BY Conversao_Posse_Gols DESC
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Conversao_Posse_Gols</th></tr>
<tr><td>Bayern Munich</td><td>1.53</td></tr>
<tr><td>Leverkusen</td><td>1.44</td></tr>
<tr><td>RB Leipzig</td><td>1.39</td></tr>
<tr><td>Hoffenheim</td><td>1.33</td></tr>
<tr><td>Stuttgart</td><td>1.30</td></tr>
<tr><td>Gladbach</td><td>1.20</td></tr>
<tr><td>Heidenheim</td><td>1.18</td></tr>
<tr><td>Dortmund</td><td>1.18</td></tr>
<tr><td>Augsburg</td><td>1.14</td></tr>
<tr><td>Werder Bremen</td><td>1.03</td></tr>
<tr><td>Eint Frankfurt</td><td>0.98</td></tr>
<tr><td>Freiburg</td><td>0.97</td></tr>
<tr><td>Bochum</td><td>0.90</td></tr>
<tr><td>Wolfsburg</td><td>0.85</td></tr>
<tr><td>Mainz 05</td><td>0.85</td></tr>
<tr><td>Union Berlin</td><td>0.77</td></tr>
<tr><td>Darmstadt 98</td><td>0.66</td></tr>
<tr><td>Köln</td><td>0.60</td></tr>
</table>

------


 **8.** Quais equipes têm a maior eficiência defensiva, considerando a razão entre gols previstos permitidos e gols sofridos por partida?
  * Interpretação dos Resultados:
   - Alta eficiência defensiva (maior que 1): A equipe está defendendo melhor do que o esperado, pois permitiu menos gols do que o previsto.
   - Baixa eficiência defensiva (menor que 1): A equipe está defendendo pior do que o esperado, pois permitiu mais gols do que o previsto.
 ````sql
SELECT 
       Equipe, 
       CAST((Gols_Previstos_permitidos / Gols_Contra) AS DECIMAL(10, 2)) AS Eficiencia_Defensiva
FROM bundesliga
ORDER BY Eficiencia_Defensiva DESC
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Eficiencia_Defensiva</th></tr>
<tr><td>Leverkusen</td><td>1.25</td></tr>
<tr><td>Dortmund</td><td>1.21</td></tr>
<tr><td>Heidenheim</td><td>1.12</td></tr>
<tr><td>Köln</td><td>1.08</td></tr>
<tr><td>Werder Bremen</td><td>1.05</td></tr>
<tr><td>Eint Frankfurt</td><td>1.04</td></tr>
<tr><td>RB Leipzig</td><td>1.03</td></tr>
<tr><td>Stuttgart</td><td>0.98</td></tr>
<tr><td>Augsburg</td><td>0.96</td></tr>
<tr><td>Hoffenheim</td><td>0.92</td></tr>
<tr><td>Freiburg</td><td>0.87</td></tr>
<tr><td>Mainz 05</td><td>0.87</td></tr>
<tr><td>Union Berlin</td><td>0.87</td></tr>
<tr><td>Bochum</td><td>0.86</td></tr>
<tr><td>Darmstadt 98</td><td>0.85</td></tr>
<tr><td>Gladbach</td><td>0.81</td></tr>
<tr><td>Wolfsburg</td><td>0.80</td></tr>
<tr><td>Bayern Munich</td><td>0.71</td></tr>
</table>



------


 **9.** Qual a média de cartões amarelos por jogo ?
 
 ````sql
SELECT 
       ROUND(CAST(SUM(Crts_A) AS FLOAT) / CAST(306 AS FLOAT), 2) AS Media_Cartoes_Jogo
FROM bundesliga
GO
````
**Resultado:**
<table>
<tr><th>Media_Cartoes_Jogo</th></tr>
<tr><td>4,15</td></tr>
</table>


------



 **10.** Quais as 5 maiores médias de público ?
 
 ````sql
SELECT TOP (5) 
       Equipe, 
       Publico
FROM bundesliga
ORDER BY Publico DESC
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Publico</th></tr>
<tr><td>Dortmund</td><td>81.305</td></tr>
<tr><td>Bayern Munich</td><td>75.000</td></tr>
<tr><td>Eint Frankfurt</td><td>56.900</td></tr>
<tr><td>Stuttgart</td><td>55.089</td></tr>
<tr><td>Gladbach</td><td>51.371</td></tr>
</table>



------



 **11.** Quais equipes têm uma média de público superior à média geral das equipes?
 
 ````sql
SELECT 
       Equipe, 
       CAST(AVG(Publico) AS DECIMAL(10,3)) AS Media_Publico
FROM bundesliga
GROUP BY Equipe
HAVING AVG(Publico) > (
       SELECT AVG(Publico)
       FROM bundesliga)
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Media_Publico</th></tr>
<tr><td>Bayern Munich</td><td>75.000</td></tr>
<tr><td>Dortmund</td><td>81.305</td></tr>
<tr><td>Eint Frankfurt</td><td>56.900</td></tr>
<tr><td>Gladbach</td><td>51.371</td></tr>
<tr><td>Köln</td><td>49.829</td></tr>
<tr><td>RB Leipzig</td><td>44.921</td></tr>
<tr><td>Stuttgart</td><td>55.089</td></tr>
<tr><td>Werder Bremen</td><td>41.721</td></tr>
</table>


------



 **12.** Liste as equipes com percentual de aproveitamento superior à média de todas as equipes.
 
 ````sql
SELECT 
       Equipe, 
       Percentual_aproveitamento
FROM bundesliga
WHERE Percentual_aproveitamento > (
       SELECT AVG(Percentual_aproveitamento)
       FROM bundesliga)
GO
````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Percentual_aproveitamento</th></tr>
<tr><td>Leverkusen</td><td>88,2</td></tr>
<tr><td>Stuttgart</td><td>71,6</td></tr>
<tr><td>Bayern Munich</td><td>70,6</td></tr>
<tr><td>RB Leipzig</td><td>63,7</td></tr>
<tr><td>Dortmund</td><td>61,8</td></tr>
<tr><td>Eint Frankfurt</td><td>46,1</td></tr>
</table>



------



 **13.** Qual equipe tem maior média de idade ?
 
 ````sql
SELECT TOP (1) 
       Equipe, 
       Media_idade
FROM bundesliga
GROUP BY Equipe, Media_idade 
ORDER BY Media_idade DESC
GO

````
**Resultado:**
<table>
<tr><th>Equipe</th><th>Media_idade</th></tr>
<tr><td>Bochum</td><td>29,1</td></tr>
</table>
