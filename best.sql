DROP TABLE IF EXISTS `best_skills`;
CREATE TABLE `best_skills` (`name` varchar(25) PRIMARY KEY, `group` varchar(25));
INSERT INTO `best_skills` (`name`, `group`) VALUES ('strength', 'abilities');
INSERT INTO `best_skills` (`name`, `group`) VALUES ('stamina', 'abilities');
INSERT INTO `best_skills` (`name`, `group`) VALUES ('sense', 'abilities');
INSERT INTO `best_skills` (`name`, `group`) VALUES ('agility', 'abilities');
INSERT INTO `best_skills` (`name`, `group`) VALUES ('intelligence', 'abilities');
INSERT INTO `best_skills` (`name`, `group`) VALUES ('psychic', 'abilities');

DROP TABLE IF EXISTS `best_items`;
CREATE TABLE `best_items` (`id` INT PRIMARY KEY AUTO_INCREMENT, `name` varchar(25), `reqs` varchar(255), `group` varchar(25), `qllimits` varchar(255));

DROP TABLE IF EXISTS `best_requirements`;
CREATE TABLE `best_requirements` (`ql` INT, `item_id` INT, `ref_low` INT, `ref_high` INT, `reqs` varchar(255));

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (1, 'cc', 'strength;agility', 'combined alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 1, 246667, 246668, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 1, 246667, 246668, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (2, 'cm', 'strength;stamina', 'combined alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 2, 246645, 246646, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 2, 246645, 246646, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (3, 'co', 'intelligence;psychic', 'combined alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 3, 246679, 246680, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 3, 246679, 246680, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (4, 'cp', 'stamina;psychic', 'combined alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 4, 246655, 246656, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 4, 246655, 246656, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (5, 'cs', 'intelligence;sense', 'combined alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 5, 246691, 246692, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 5, 246691, 246692, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (6, 'css', 'agility;sense', 'combined alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 6, 246703, 246704, '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 6, 246703, 246704, '1000;1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (7, 'ofab advy', 'agility;strength', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 7, 264200, 264201, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 7, 264200, 264201, '1045;900');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (8, 'ofab agent', 'agility;sense', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 8, 264311, 264312, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 8, 264311, 264312, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (9, 'ofab crat', 'intelligence;psychic', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 9, 264527, 264528, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 9, 264527, 264528, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (10, 'ofab doc', 'stamina;psychic', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 10, 264674, 264675, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 10, 264674, 264675, '1100;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (11, 'ofab enf', 'strength;stamina', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 11, 264217, 264218, '4;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 11, 264217, 264218, '900;1100');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (12, 'ofab engineer', 'intelligence;psychic', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 12, 264602, 264603, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 12, 264602, 264603, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (13, 'ofab fixer', 'agility;sense', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 13, 264491, 264492, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 13, 264491, 264492, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (14, 'ofab keeper', 'stamina;strength', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 14, 264638, 264639, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 14, 264638, 264639, '1100;900');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (15, 'ofab ma', 'agility;strength', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 15, 264347, 264348, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 15, 264347, 264348, '1045;900');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (16, 'ofab mp', 'intelligence;psychic', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 16, 264383, 264384, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 16, 264383, 264384, '1045;845');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (17, 'ofab nt', 'intelligence;psychic', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 17, 264419, 264420, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 17, 264419, 264420, '1045;845');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (18, 'ofab shade', 'agility;sense', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 18, 264563, 264564, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 18, 264563, 264564, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (19, 'ofab soldier', 'strength;stamina', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 19, 264455, 264456, '4;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 19, 264455, 264456, '900;1100');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (20, 'ofab trader', 'intelligence;psychic', 'ofab armor', '25;50;75;100;125;150;175;200;225;250;275;300');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 20, 264281, 264282, '5;4');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 20, 264281, 264282, '1045;855');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (21, 'miy melee', 'sense;agility', 'miy''s armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 21, 268858, 268859, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 21, 268858, 268859, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (22, 'miy nano', 'intelligence;psychic', 'miy''s armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 22, 268844, 268845, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 22, 268844, 268845, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (23, 'miy ranged', 'agility;strength', 'miy''s armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 23, 268870, 268871, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 23, 268870, 268871, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (24, 'miy scary', 'intelligence;sense', 'miy''s armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 24, 268894, 268895, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 24, 268894, 268895, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (25, 'miy tank', 'stamina;strength', 'miy''s armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 25, 268882, 268883, '6;5');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 25, 268882, 268883, '825;765');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (26, 'carbonum', 'stamina;agility', 'froob armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 26, 162433, 162434, '11;8');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 26, 162433, 162434, '580;476');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (27, 'cas', 'stamina;strength', 'froob armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 27, 164997, 164998, '10;9');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (108, 27, 164997, 164998, '300;278');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 27, 164997, 164998, '550;510');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (28, 'barter', 'intelligence;psychic', 'froob armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 28, 164941, 164942, '10;8');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 28, 164941, 164942, '541;521');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (29, 'apocalypse', 'sense;agility', 'froob armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (10, 29, 245966, 245967, '50;50');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 29, 245966, 245967, '550;550');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (30, 'junkmetal', 'agility;strength', 'froob armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 30, 206684, 206685, '10;7');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 30, 206684, 206685, '580;476');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (31, 'supple', 'agility', 'alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 31, 246621, 246622, '10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 31, 246621, 246622, '1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (32, 'strong', 'strength', 'alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 32, 246615, 246616, '10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 32, 246615, 246616, '1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (33, 'arithmetic', 'intelligence', 'alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 33, 246559, 246560, '10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 33, 246559, 246560, '1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (34, 'observant', 'sense', 'alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 34, 246591, 246592, '10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 34, 246591, 246592, '1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (35, 'spiritual', 'psychic', 'alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 35, 246599, 246600, '10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 35, 246599, 246600, '1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (36, 'enduring', 'stamina', 'alien armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 36, 246579, 246580, '10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (300, 36, 246579, 246580, '1000');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (37, 'nova dillon', 'sense;agility', 'froob buff armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 37, 163945, 163946, '8;8');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 37, 163945, 163946, '511;461');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (38, 'kirch kevlar', 'agility;strength', 'froob buff armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 38, 160338, 160339, '8;8');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 38, 160338, 160339, '526;476');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (39, 'sekutek', 'stamina;strength', 'froob buff armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 39, 160391, 160392, '8;8');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 39, 160391, 160392, '511;461');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (40, 'steel ribbed', 'sense;agility', 'froob armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (25, 40, 245929, 245930, '75;75');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 40, 245929, 245930, '550;550');

INSERT INTO `best_items` (`id`, `name`, `reqs`, `group`, `qllimits`) VALUES (41, 'rhinoman leather', 'stamina;strength', 'froob armor', null);
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (1, 41, 268518, 268519, '11;11');
INSERT INTO `best_requirements` (`ql`, `item_id`, `ref_low`, `ref_high`, `reqs`) VALUES (200, 41, 268518, 268519, '701;701');
