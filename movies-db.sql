# 3 - Adicione um gênero à tabela de gêneros.
INSERT INTO genres
(
id,
created_at,
updated_at,
name,
ranking,
active
)
VALUES
(
13,
"2021-06-16",
"2021-06-16",
"Corrida",
9.6,
1
);

# 2 - Adicione um filme à tabela de filmes.
# 4 - Associe o filme do Ex 2. ao gênero criado no Ex. 3.
INSERT INTO movies_db.movies
(created_at,
updated_at,
title,
rating,
awards,
release_date,
length,
genre_id)
VALUES
(
"2021-06-16",
"2021-06-16",
"Velozes e Furiosos 27",
9.6,
0,
"2021-05-12",
130,
13);

# 5 - Modifique a tabela de atores para que pelo menos um ator tenha como favorito o filme adicionado no Ex. 2.
UPDATE actors SET favorite_movie_id = 22 where id = 4;

# 6 - Crie uma cópia temporária da tabela de filmes.
CREATE TEMPORARY TABLE IF NOT EXISTS temporary_movies
AS (
 SELECT * FROM movies
);

# 7 - Elimine desta tabela temporária todos os filmes que ganharam menos de 5 prêmios.
# EXPLAIN
DELETE FROM temporary_movies A
WHERE A.awards < 5;

# 10 - Use o plano de execução para analisar as consultas nos Ex 6 e 7.
# EXPLAIN ANALYZE 
SELECT * FROM temporary_movies;

# DROP TABLE temporary_movies;

# 8 - Obtenha a lista de todos os gêneros que possuem pelo menos um filme.
SELECT 
 A.name
FROM genres A
INNER JOIN movies B ON A.id = B.genre_id
GROUP BY A.name;

# 9 - Obtenha a lista de atores cujo filme favorito ganhou mais de 3 prêmios.
SELECT 
 A.first_name,
 A.last_name,
 B.title,
 B.awards
FROM actors A
INNER JOIN movies B on A.favorite_movie_id = B.id
WHERE B.awards > 3;

# 12 - Crie um índice sobre o nome na tabela de filmes.
CREATE INDEX `movies.idx_title` ON movies(title);
