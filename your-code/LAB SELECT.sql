USE lab_select;

SELECT authors.au_id as `author ID`, au_lname as `last name`, au_fname as `first name` , title as `title`, pub_name as `publisher`	FROM titles	
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN authors
ON titleauthor.au_id= authors.au_id
JOIN publishers	
ON publishers.pub_id=authors.au_id
;



SELECT authors.au_id AS `author ID` ,  au_lname AS `last name`, au_fname AS `first name`, pub_name AS `publisher`, 	
COUNT(pub_name) AS `title count`	

FROM titles	
JOIN titleauthor 
ON titles.title_id = titleauthor.title_id
JOIN authors
ON titleauthor.au_id= authors.au_id
JOIN publishers
ON publishers.pub_id = authors.au_id

GROUP BY `author ID` , `last name`, `first name`,  `publisher`
ORDER BY `title count` DESC
;	
