DROP TABLE IF EXISTS `best_skills`;
CREATE TABLE `best_skills` (`name` varchar(25) PRIMARY KEY);
INSERT INTO `best_skills` (`name`) VALUES ('strength');
INSERT INTO `best_skills` (`name`) VALUES ('stamina');
INSERT INTO `best_skills` (`name`) VALUES ('sense');
INSERT INTO `best_skills` (`name`) VALUES ('agility');
INSERT INTO `best_skills` (`name`) VALUES ('intelligence');
INSERT INTO `best_skills` (`name`) VALUES ('psychic');

DROP TABLE IF EXISTS `best_items`;
CREATE TABLE `best_items` (`id` INT PRIMARY KEY AUTO_INCREMENT, `name` varchar(25), `reqs` varchar(255));

DROP TABLE IF EXISTS `best_requirements`;
CREATE TABLE `best_requirements` (`ql` INT, `item_id` INT, `item_ref` INT, `reqs` varchar(255));

-- Combined Armor

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (1, 'cc', 'strength;agility');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 1, 246667, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 1, 246668, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (2, 'cm', 'strength;stamina');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 2, 246645, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 2, 246646, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (3, 'co', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 3, 246679, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 3, 246680, '1000;1000');


INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (4, 'cp', 'stamina;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 4, 246655, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 4, 246656, '1000;1000');


INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (5, 'cs', 'intelligence;sense');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 5, 246691, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 5, 246692, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (6, 'css', 'agility;sense');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 6, 246703, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 6, 246704, '1000;1000');

-- Ofab Armor

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (7, 'ofab advy', 'agility;strength');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 7, 264200, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 7, 264201, '1045;900');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (8, 'ofab agent', 'agility;sense');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 8, 264311, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 8, 264312, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (9, 'ofab crat', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 9, 264527, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 9, 264528, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (10, 'ofab doc', 'stamina;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 10, 264674, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 10, 264675, '1100;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (11, 'ofab enf', 'strength;stamina');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 11, 264217, '4;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 11, 264218, '900;1100');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (12, 'ofab engineer', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 12, 264602, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 12, 264603, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (13, 'ofab fixer', 'agility;sense');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 13, 264491, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 13, 264492, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (14, 'ofab keeper', 'stamina;strength');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 14, 264638, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 14, 264639, '1100;900');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (15, 'ofab ma', 'agility;strength');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 15, 264347, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 15, 264348, '1045;900');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (16, 'ofab mp', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 16, 264383, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 16, 264384, '1045;845');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (17, 'ofab nt', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 17, 264419, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 17, 264420, '1045;845');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (18, 'ofab shade', 'agility;sense');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 18, 264563, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 18, 264564, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (19, 'ofab soldier', 'strength;stamina');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 19, 264455, '4;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 19, 264456, '900;1100');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (20, 'ofab trader', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 20, 264281, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 20, 264282, '1045;855');

-- miy's

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (21, 'miy melee', 'sense;agility');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 21, 268858, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 21, 268859, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (22, 'miy nano', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 22, 268844, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 22, 268845, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (23, 'miy ranged', 'agility;strength');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 23, 268870, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 23, 268871, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (24, 'miy scary', 'intelligence;sense');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 24, 268894, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 24, 268895, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (25, 'miy tank', 'stamina;strength');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 25, 268882, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 25, 268883, '825;765');

-- froob

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (26, 'carbonum', 'stamina;agility');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 26, 162433, '11;8');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (200, 26, 162434, '580;476');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (27, 'cas', 'stamina;strength');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 27, 164997, '10;9');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (200, 27, 164998, '550;510');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (28, 'barter', 'intelligence;psychic');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 28, 164941, '10;8');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (200, 28, 164942, '541;521');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (29, 'apocalypse', 'sense;agility');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (10, 29, 245966, '50;50');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (200, 29, 245967, '550;550');

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (30, 'junkmetal', 'agility;strength');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 30, 206684, '10;7');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (200, 30, 206685, '580;476');
