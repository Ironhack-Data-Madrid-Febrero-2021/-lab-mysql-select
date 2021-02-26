SELECT * FROM `lab-publications-mysql`.authors;
SELECT * FROM `lab-publications-mysql`.titleauthor;
SELECT * FROM `lab-publications-mysql`.titles;
SELECT * FROM `lab-publications-mysql`.publishers;


USE `lab-publications-mysql`;

-- CHALLENGE 1 

		SELECT `authors`.`au_id`AS `AUTHOR ID`, `au_lname`AS `LAST NAME`, `au_fname` AS `FIRST NAME`
			FROM `authors`
					JOIN  `titleauthor` AS `TITLE AUTHOR` 
							ON  `authors`.`au_id` = `TITLE AUTHOR`.`au_id`
					JOIN `titles` AS `TITLES` 
							ON  `TITLE AUTHOR`.`title_id` = `TITLES`.`title_id`
					JOIN  `publishers` AS `PUBLISHER` 	
							ON  `PUBLISHER`.`pub_id` = `titles`.`pub_id`;
			
    
						
    
    