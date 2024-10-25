USE oscar_database;

SELECT * FROM indicados_ao_oscar;
-- Quantos Oscars Natalie Portman ganhou?
SELECT COUNT(*) FROM indicados_ao_oscar WHERE vencedor = true;
-- Amy Adams já ganhou algum Oscar?
SELECT COUNT(*) > 0 FROM indicados_ao_oscar WHERE nome_do_indicado LIKE '%Emil%' AND vencedor = 'true';
-- A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT ano_cerimonia FROM indicados_ao_oscar WHERE vencedor = 'true' AND nome_do_filme LIKE '%Toy Story%';
-- A partir de que ano que a categoria "Actress" deixa de existir?
SELECT ano_cerimonia FROM indicados_ao_oscar WHERE categoria = 'Actress' ORDER BY ano_cerimonia DESC LIMIT 1;
-- Quem ganhou o primeiro Oscar para Melhor Atriz? Em que ano?
SELECT nome_do_indicado, ano_cerimonia FROM indicados_ao_oscar WHERE categoria = 'ACTRESS IN A LEADING ROLE' ORDER BY ano_cerimonia LIMIT 1;
-- Na campo "Vencedor", altere todos os valores com "true" para 1 e todos os valores "false" para 0.
UPDATE indicados_ao_oscar SET vencedor = 1 WHERE vencedor = 'true';
UPDATE indicados_ao_oscar SET vencedor = 0 WHERE vencedor = 'false';
-- Em qual edição do Oscar "Crash" concorreu ao Oscar?
SELECT ano_cerimonia FROM indicados_ao_oscar WHERE nome_do_filme = 'Crash' LIMIT 1;
-- O filme Central do Brasil aparece no Oscar?
SELECT COUNT(*) > 0 FROM indicados_ao_oscar WHERE nome_do_filme LIKE '%Central do Brasil%';
-- Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser.
INSERT INTO indicados_ao_oscar (ano_filmagem, ano_cerimonia, cerimonia, categoria, nome_do_indicado, nome_do_filme, vencedor)
VALUES (2024, 2025, 97, 'BEST PICTURE', 'Coralie Fargeat, Demi Moore, Margaret Qualley', 'The Substance', 'true'),
(2024, 2025, 97, 'ACTRESS IN A LEADING ROLE', 'Demi Moore', 'The Substance', 'true');
-- Denzel Washington já ganhou algum Oscar?
SELECT COUNT(*) > 0 FROM indicados_ao_oscar WHERE nome_do_indicado LIKE '%Denzel Washington%' AND vencedor LIKE 'true';
-- Quais os filmes que ganharam o Oscar de Melhor Filme?
SELECT DISTINCT nome_do_filme FROM indicados_ao_oscar WHERE vencedor = 1;
-- Bonus: Quais os filmes que ganharam o Oscar de Melhor Filme e Melhor Diretor na mesma cerimonia?
SELECT nome_do_filme FROM indicados_ao_oscar WHERE categoria IN ('BEST PICTURE','DIRECTING') AND vencedor LIKE 1;
-- Bonus: Denzel Washington e Jamie Foxx já concorreram ao Oscar no mesmo ano?
SELECT COUNT(*) > 0 AS indicados_na_mesma_cerimonia
FROM (
    SELECT ano_cerimonia
    FROM indicados_ao_oscar
    WHERE nome_do_indicado IN ('Denzel Washington', 'Jamie Foxx')
    GROUP BY ano_cerimonia
    HAVING COUNT(DISTINCT nome_do_indicado) = 2
) AS cerimonias_com_ambos;