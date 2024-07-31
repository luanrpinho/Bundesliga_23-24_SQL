/* Atualizando as colunas*/
UPDATE bundesliga
SET Percentual_aproveitamento = CAST(Percentual_aproveitamento * 100 AS DECIMAL(5, 1))
GO

UPDATE bundesliga
SET Posse_Bola = CAST(Posse_Bola * 100 AS DECIMAL(5, 1))
GO

ALTER TABLE bundesliga
ALTER COLUMN Publico DECIMAL(10, 3)
GO


/*1. Qual equipe teve o maior número de vitórias ? */
SELECT TOP (1) 
       Equipe, 
       MAX(Vitorias) AS Max_Vitórias
FROM bundesliga
GROUP BY Equipe
ORDER BY Max_Vitórias DESC
GO

/*2. Quais as equipes classificadas para a UEFA Champions League da próxima temporada ? */
SELECT TOP (5) 
       Classificacao, 
       Equipe, 
       Notas
FROM bundesliga
ORDER BY Classificacao ASC
GO

/*3. Quais equipes com aproveitamento maior ou igual a 70% ? */
SELECT 
       Equipe, 
       Percentual_aproveitamento
FROM bundesliga
WHERE Percentual_aproveitamento >= 70
ORDER BY Percentual_aproveitamento DESC
GO

/*4. Qual equipe com maior número de cartões vermelhos ? */
SELECT TOP (1) 
       Equipe, 
       SUM(Crts_V) AS Total_Cartoes_Vermelhos
FROM bundesliga
GROUP BY Equipe
ORDER BY Total_Cartoes_Vermelhos DESC
GO

/*5. Qual a média de público total do campeonato ? */
SELECT 
       CAST(AVG(Publico) AS DECIMAL(10, 3)) AS Média_Campeonato
FROM bundesliga
GO

/*6. Qual é a equipe que tem a maior melhoria em termos de diferença de gols esperada em comparação com a diferença de gols real? */
SELECT 
       Equipe, 
       (Diferenca_gols - Diferenca_gols_esperada) AS Melhoria_Diferenca_Gols
FROM bundesliga
ORDER BY Melhoria_Diferenca_Gols DESC
GO

/*7. Quais equipes têm uma alta taxa de conversão de posse de bola em gols, considerando a razão entre gols marcados e posse de bola? */
SELECT 
       Equipe, 
       CAST((Gols_Por / Posse_Bola) AS DECIMAL(10,2)) AS Conversao_Posse_Gols
FROM bundesliga
ORDER BY Conversao_Posse_Gols DESC
GO

/*8. Quais equipes têm a maior eficiência defensiva, considerando a razão entre gols previstos permitidos e gols sofridos por partida? */
SELECT 
       Equipe, 
       CAST((Gols_Previstos_permitidos / Gols_Contra) AS DECIMAL(10, 2)) AS Eficiencia_Defensiva
FROM bundesliga
ORDER BY Eficiencia_Defensiva DESC
GO
/* Interpretação dos Resultados
   Alta eficiência defensiva (maior que 1): A equipe está defendendo melhor do que o esperado, pois permitiu menos gols do que o previsto.
   Baixa eficiência defensiva (menor que 1): A equipe está defendendo pior do que o esperado, pois permitiu mais gols do que o previsto.
*/

/*9. Qual a média de cartões amarelos por jogo ? */
SELECT 
       ROUND(CAST(SUM(Crts_A) AS FLOAT) / CAST(306 AS FLOAT), 2) AS Media_Cartoes_Jogo
FROM bundesliga
GO

/*10. Quais as 5 maiores médias de público ? */
SELECT TOP (5) 
       Equipe, 
       Publico
FROM bundesliga
ORDER BY Publico DESC
GO

/*11. Quais equipes têm uma média de público superior à média geral das equipes? */
SELECT 
       Equipe, 
       CAST(AVG(Publico) AS DECIMAL(10,3)) AS Media_Publico
FROM bundesliga
GROUP BY Equipe
HAVING AVG(Publico) > (
       SELECT AVG(Publico)
       FROM bundesliga)
GO

/*12. Liste as equipes com percentual de aproveitamento superior à média de todas as equipes. */
SELECT 
       Equipe, 
       Percentual_aproveitamento
FROM bundesliga
WHERE Percentual_aproveitamento > (
       SELECT AVG(Percentual_aproveitamento)
       FROM bundesliga)
GO

/*13. Qual equipe tem maior média de idade ? */ 
SELECT TOP (1) 
       Equipe, 
       Media_idade
FROM bundesliga
GROUP BY Equipe, Media_idade 
ORDER BY Media_idade DESC
GO

