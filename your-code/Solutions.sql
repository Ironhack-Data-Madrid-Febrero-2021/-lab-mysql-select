SELECT * FROM `lab-publications-mysql`.authors;
SELECT * FROM `lab-publications-mysql`.titleauthor;
SELECT * FROM `lab-publications-mysql`.titles;
SELECT * FROM `lab-publications-mysql`.publishers;



USE `lab-publications-mysql`;
SELECT `authors`.`au_id`AS `AUTHOR ID`, `au_lname`AS `LAST NAME`, `au_fname` AS `FIRST NAME`, TITLES.title AS `TITLE`,`pub_name` AS `PUBLISHERS`
			FROM `authors`
					JOIN  `titleauthor` AS `TITLE AUTHOR` 
							ON  `authors`.`au_id` = `TITLE AUTHOR`.`au_id`
					JOIN `titles` AS `TITLES` 
							ON  `TITLE AUTHOR`.`title_id` = `TITLES`.`title_id`
					JOIN  `publishers` AS `PUBLISHER` 	
							ON  `PUBLISHER`.`pub_id` = `titles`.`pub_id`
ORDER BY `AUTHOR ID`;
    
    
    
-- CHALLENGE 2

USE `lab-publications-mysql`; 

SELECT `authors`.`au_id` AS `AUTHOR ID`, `au_lname` AS `LAST NAME`, `au_fname` AS `FIRST NAME`, `pub_name` AS ` PUBLISHER`, 
COUNT(`titles`.`title_id`) AS `TITLE COUNT`   

	FROM `authors`
		JOIN `titleauthor` AS `ta`    ON `ta`.`au_id` = `authors`.`au_id`
		JOIN `titles`                  ON `titles`.`title_id` = `ta`.`title_id`
		JOIN `publishers` AS `p`       ON `p`.`pub_id` = `titles`.`pub_id`
        
	GROUP BY `p`.`pub_id`, `AUTHOR ID`
    ORDER BY `AUTHOR ID` DESC;
    
    
-- select  `AUTHOR ID`, sum(`TITLE COUNT`) FROM `authors`    GROUP BY `AUTHOR ID`;						
    



-- CHALLENGE 3

SELECT `authors`.`au_id` AS ` AUTHOR_ID`, `au_lname` AS `LAST NAME`, `au_fname` AS `FIRTS NAME`, SUM(`qty`) AS `TOTAL`
	FROM `authors` 
		JOIN `titleauthor` AS `TA`      ON  `TA`.au_id = `authors`.`au_id`
        JOIN `titles` AS T              ON   `T`.`title_id` = `TA`.`title_id`
        JOIN `sales`                    ON   `sales`.`title_id` = `T`.`title_id`
        
	GROUP BY  `qty`
    ORDER BY `total` DESC
    LIMIT 3;
 
 
 
 -- CHALLENGE 4
 
  SELECT `authors`.`au_id` AS ` AUTHOR_ID`, `au_lname` AS `LAST NAME`, `au_fname` AS `FIRTS NAME`, IFNULL(SUM(`qty`), 0) AS `TOTAL`
	FROM `authors` 
		LEFT JOIN `titleauthor` AS `TA`       ON  `TA`.au_id = `authors`.`au_id`
        LEFT JOIN  `titles` AS T              ON   `T`.`title_id` = `TA`.`title_id`
        LEFT JOIN  `sales`                    ON   `sales`.`title_id` = `T`.`title_id`
        
	GROUP BY  authors.au_id
    ORDER BY `total` DESC;
 
 
 -- BONUS
 
 
 SELECT  authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, (advance + royalty)  AS PROFIT
	FROM authors 
		JOIN titleauthor AS TA           ON    authors.au_id = TA.au_id
        JOIN titles AS T                 ON    T.title_id = TA.title_id
        
    ORDER BY PROFIT DESC;
 
-- Lo intenté de varias formas posibles pero me daban error te dejo la más probable y la que me dió un resultado posible, 
-- posible porque no me dió la cabeza para llegar a comprobarla, tal cual Excel buscas un "total suma" y compruebas el total de tu columna
-- que ya me hago una idea pero me toca probar. En realidad salgo muy contenta de este lab porque SQL y yo ya nos vamos llevando bien.   