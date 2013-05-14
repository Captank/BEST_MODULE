DROP TABLE IF EXISTS `best_items`;
CREATE TABLE `best_items` (`id` INT PRIMARY KEY AUTO_INCREMENT,`name` varchar(15), `reqs` varchar(255));
DROP TABLE IF EXISTS `best_requirements`;
CREATE TABLE IF NOT EXISTS `best_requirements` (`ql` INT, `item_id` INT, `item_ref` varchar(50), `reqs` varchar(255));

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (1, 'css', 'agility;sense');

INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (1, 1, '246703', '10;10');
INSERT INTO `best_requirements` (`ql`, `item_id`, `item_ref`, `reqs`) VALUES (300, 1, '246704', '1000;1000');
