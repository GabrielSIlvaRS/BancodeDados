CREATE TABLE IF NOT EXISTS Player(
id INT AUTO_INCREMENT PRIMARY KEY,
name_player VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS  Group_player(
id INT AUTO_INCREMENT PRIMARY KEY,
name_group VARCHAR(100) NOT NULL
);

ALTER TABLE player ADD id_group INT;

ALTER TABLE player ADD CONSTRAINT fk_group_player FOREIGN KEY (id_group) REFERENCES player(id);

CREATE TABLE game(
id INT PRIMARY KEY,
name_game VARCHAR(100)
);

CREATE TABLE result(
id INT AUTO_INCREMENT PRIMARY KEY,
player_id INT,
game_id INT,
point_game INT,
departure_date DATE,
FOREIGN KEY (player_id) REFERENCES player(id),
FOREIGN KEY (game_id) REFERENCES game(id)
);

INSERT INTO group_player (name_group) VALUES 
('Equipe Capivaras  Assassinas'),
('Equipe Nepal'),
('Equipe Enner Valência'),
('Equipe Smurfs');

INSERT INTO player (name_player, id_group) VALUES 
('Ana', 1),
('Gabriel', 1),
('Luisa', 1),
('Eduardo', 1),
('Robson', 1),

('Bruno Carvalho', 2),
('Bruno Henrique', 2),
('Angelo Cuiato', 2),
('Brunna', 2),
('Dave', 2),

('Guilherme', 3),
('Arthur', 3),
('Pedro', 3),
('Heitor', 3),
('Leonardo', 3),

('Kaua', 4),
('Gregori', 4),
('Ederson', 4),
('Davis', 4),
('Athos', 4);

INSERT INTO game (id, name_game) VALUES 
(1, 'Xadrez'),
(2, 'Damas'),
(3, 'Uno'),
(4, 'Pife'),
(5, 'Ping Pong');

INSERT INTO result (player_id, game_id, point_game, departure_date) VALUES 
(1, 2, 0, '2025-07-14'),
(2, 5, 0 , '2025-07-14'),
(3, 3, 0, '2025-07-14'),
(4, 1, 0, '2025-07-14'),
(5, 4, 3, '2025-07-14'),
(6, 5, 3, '2025-07-14'),
(7, 3, 2, '2025-07-14'),
(8, 2, 1, '2025-07-14'),
(9, 4, 2, '2025-07-14'),
(10, 1, 3, '2025-07-14'),
(11, 1, 1, '2025-07-14'),
(12, 5, 1, '2025-07-14'),
(13, 4, 0, '2025-07-14'),
(14, 2, 2, '2025-07-14'),
(15, 3, 3, '2025-07-14'),
(16, 2, 3, '2025-07-14'),
(17, 4, 1, '2025-07-14'),
(18, 1, 2, '2025-07-14'),
(19, 5, 2, '2025-07-14'),
(20, 3, 1, '2025-07-14');

-- Consulta 1
SELECT player.name_player, group_player.name_group
FROM player 
INNER JOIN group_player ON player.id_group = group_player.id;




SELECT 
  gp.name_group,
  MIN(r.point_game) AS menor_ponto
FROM result r
JOIN player p ON r.player_id = p.id
JOIN group_player gp ON p.id_group = gp.id
GROUP BY gp.name_group;

SELECT 
  gp.name_group,
  MAX(r.point_game) AS maior_ponto
FROM result r
JOIN player p ON r.player_id = p.id
JOIN group_player gp ON p.id_group = gp.id
GROUP BY gp.name_group;


SELECT SUM(point_game) AS valor_total 
FROM result WHERE group_player.id;