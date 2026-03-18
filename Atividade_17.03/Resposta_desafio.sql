CREATE SCHEMA DESAFIO;

-- criação da tabela 'Publishers'
CREATE TABLE Publishers(
	IDpub INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(40) UNIQUE,
    Num_publicacoes INT DEFAULT 0,
    Data_fundacao DATE
);

-- Criação da tabela 'Jogo'
CREATE TABLE Jogos(
	IDjogo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL UNIQUE,
	Plataforma VARCHAR(30),
    Data_publicacao DATE,
    IDpub INT,
    
    FOREIGN KEY (IDpub) REFERENCES Publishers (IDpub)
);

-- Alteração do atributo 'Nome' na tabela 'Jogos' 
ALTER TABLE Jogos 
MODIFY COLUMN Nome VARCHAR(150) NOT NULL UNIQUE;

-- Processo de adicionar linhas/registros à tabela correspondente
-- Primeiro farei a adição à tabela 'Publishers'
INSERT INTO Publishers (Nome, Num_publicacoes, Data_fundacao) 
VALUES
	('Nintendo', 500, '1889-09-23'),
	('Sony Interactive Entertainment', 200, '1993-11-16'),
	('Electronic Arts', 300, '1982-05-27'),
	('Ubisoft', 250, '1986-03-28'),
	('Sega', 400, '1960-06-03'),
	('Rockstar Games', 50, '1998-12-01'),
	('Activision Blizzard', 150, '2008-07-10'),
	('Square Enix', 180, '1975-09-22'),
	('Capcom', 220, '1979-05-30'),
	('Bandai Namco', 310, '1955-06-01');
    
-- Agora adicionando à tabela 'Jogos'
INSERT INTO Jogos (Nome, Plataforma, Data_publicacao, IDpub)
VALUE
	('The Legend of Zelda: Tears of the Kingdom', 'Nintendo Switch', '2023-05-12', 1),
	('Super Mario Bros. Wonder', 'Nintendo Switch', '2023-10-20', 1),
	('God of War Ragnarok', 'Console', '2022-11-09', 2),
	('Horizon Forbidden West', 'Console', '2022-02-18', 2),
	('The Sims 4', 'PC', '2014-09-02', 3),
	('Star Wars Jedi: Survivor', 'PC', '2023-04-28', 3),
	('Far Cry 6', 'Console', '2021-10-07', 4),
	('Sonic Frontiers', 'Console', '2022-11-08', 5),
	('Grand Theft Auto V', 'PC', '2015-04-14', 6),
	('Elden Ring', 'PC', '2022-02-25', 10),
	('Street Fighter 6', 'Console', '2023-06-02', 9),
	('Cyberpunk 2077', 'PC', '2020-12-10', NULL),
	('Baldur''s Gate 3', 'PC', '2023-08-03', NULL),
	('Hollow Knight', 'Console', '2017-02-24', NULL);
    
-- Usando o DELETE como um exemplo de DML
DELETE FROM Jogos
WHERE IDjogo = 44;

-- Exemplo de uso do SELECT para visualizar todos os registros e atributos da tabela 'Jogos'
SELECT * FROM Jogos;

-- Exemplo de uso defunções agregadas e implementadas com o uso de agrupamento
SELECT COUNT(*), Plataforma FROM Jogos
GROUP BY Plataforma;

SELECT Nome, Num_publicacoes 
FROM Publishers
WHERE Num_publicacoes > (SELECT AVG(Num_publicacoes) FROM Publishers)
ORDER BY Num_publicacoes DESC;

SELECT MAX(Num_publicacoes),Nome FROM Publishers;

-- Exemplo de uso do LEFT JOIN e GROUP BY no mesmo caso
SELECT COUNT(Jogos.IDjogo) AS IDpub, Publishers.Nome 
FROM Jogos LEFT JOIN Publishers ON Jogos.IDpub = Publishers.IDpub 
GROUP BY Publishers.IDpub, Publishers.Nome;