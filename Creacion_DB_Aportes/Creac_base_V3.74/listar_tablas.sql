select table_name, column_name from information_schema.columns  
where table_schema='aportes_V3_74' and table_name IN (
 select table_name from information_schema.tables where table_schema='aportes_V3_74'ORDER BY table_name) ;


select table_name from information_schema.tables where table_schema='aportes_V3_74';

select column_name from information_schema.columns  where table_schema='aportes_V3_74' and table_name IN (
select table_name from information_schema.tables where table_schema='aportes_V3_74';)


DELIMITER $$
 
CREATE PROCEDURE build_email_list (INOUT email_list varchar(4000))
BEGIN
 
 DECLARE v_finished INTEGER DEFAULT 0;
        DECLARE v_email varchar(100) DEFAULT "";
 
 -- declare cursor for employee email
 DEClARE email_cursor CURSOR FOR 
 SELECT email FROM employees;
 
 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
 
 OPEN email_cursor;
 
 get_email: LOOP
 
 FETCH email_cursor INTO v_email;
 
 IF v_finished = 1 THEN 
 LEAVE get_email;
 END IF;
 
 -- build email list
 SET email_list = CONCAT(v_email,";",email_list);
 
 END LOOP get_email;
 
 CLOSE email_cursor;
 
END$$
 
DELIMITER ;

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

