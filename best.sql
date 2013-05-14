CREATE TABLE IF NOT EXISTS `best_items` (`id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(15) NOT NULL,`reqs` varchar(255) NOT NULL, PRIMARY KEY (`id`));
CREATE TABLE IF NOT EXISTS `best_requirements` (`ql` int(11) NOT NULL, `item_id` int(11) NOT NULL, `itemref` varchar(50) NOT NULL, `reqvalues` varchar(255) NOT NULL);

INSERT INTO `best_items` (`id`, `name`, `reqs`) VALUES (1, 'css', 'agility;sense');

INSERT INTO `best_requirements` (`ql`, `item_id`, `itemref`, `reqvalues`) VALUES (1, 1, '123/124', '1;1');
INSERT INTO `best_requirements` (`ql`, `item_id`, `itemref`, `reqvalues`) VALUES (50, 1, '124/125', '100;100');
INSERT INTO `best_requirements` (`ql`, `item_id`, `itemref`, `reqvalues`) VALUES (200, 1, '125/126', '500;500');
