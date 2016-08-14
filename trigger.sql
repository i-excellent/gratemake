CREATE DEFINER=`root`@`%` TRIGGER `work_count_minus` AFTER DELETE ON `work` FOR EACH ROW BEGIN
    UPDATE menu SET menu.count = menu.count - 1 WHERE OLD.id_menu = menu.id;
    UPDATE subject SET subject.count = subject.count - 1 WHERE OLD.id_subject = subject.id;
END