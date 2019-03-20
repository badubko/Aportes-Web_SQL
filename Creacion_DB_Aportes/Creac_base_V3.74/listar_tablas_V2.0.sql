DELIMITER $$
-- -----------------------------------------------------------------------------
CREATE PROCEDURE lista_tablas (INOUT base_name varchar(4000))
BEGIN
 
 DECLARE v_finished INTEGER DEFAULT 0;
        DECLARE tab_name varchar(100) DEFAULT "";
 
 -- declare cursor for employee email
 DEClARE t_name_cursor CURSOR FOR 
 SELECT table_name FROM information_schema.tables WHERE table_schema = @base_name ;
 
 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
 
 OPEN t_name_cursor;
 
 get_tables: LOOP
 
 FETCH t_name_cursor INTO tab_name;
 
 IF v_finished = 1 THEN 
 LEAVE get_tables;
 END IF;
 
 -- build email list
-- SET email_list = CONCAT(v_email,";",email_list);
 select column_name from information_schema.columns  where table_schema=@base_name and table_name= @tab_name;
 
 END LOOP get_tables;
 
 CLOSE t_name_cursor;
 
END$$
 
DELIMITER ;
