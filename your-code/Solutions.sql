
USE publications;	

-- CHALLENGE 1: Who Have Published What At Where? --	

SELECT authors.au_id AS `AUTHOR ID` ,  au_lname AS`LAST NAME`,  au_fname AS `FIRST NAME`, title AS `TITLE`, pub_name AS `PUBLISHER`	
FROM authors	
	
JOIN titleauthor 	
ON titleauthor.au_id = authors.au_id	
JOIN titles	
ON titles.title_id = titleauthor.title_id	
JOIN publishers	
ON publishers.pub_id = titles.pub_id	
;	
	
-- CHALLENGE 2: Who Have Published How Many At Where? --	
		
SELECT authors.au_id AS `AUTHOR ID` ,  au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, pub_name AS `PUBLISHER`, 	
COUNT(pub_name) AS `TITLE COUNT`	
	
FROM authors	
	JOIN titleauthor 
		ON titleauthor.au_id = authors.au_id
	JOIN titles
		ON titles.title_id = titleauthor.title_id
	JOIN publishers
		ON publishers.pub_id = titles.pub_id
        	
GROUP BY `AUTHOR ID` , `FIRST NAME`, `LAST NAME`, `PUBLISHER`
ORDER BY `TITLE COUNT` DESC, `AUTHOR ID` DESC
;	
SELECT COUNT(*) FROM `titleauthor`;
## aqui hay que contar la columna de TITLE COUNT para saber si el resultado es el correcto

-- CHALLENGE 3: Best Selling Authors --

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, 
SUM(sales.qty) AS TOTAL

FROM authors	
	JOIN titleauthor 
		ON titleauthor.au_id = authors.au_id
	JOIN titles
		ON titles.title_id = titleauthor.title_id
	JOIN sales
		ON titles.title_id = sales.title_id
    
GROUP BY `AUTHOR ID` , `FIRST NAME`, `LAST NAME`
ORDER BY `TOTAL` DESC
LIMIT 3
;

-- CHALLENGE 4: Best Selling Authors Ranking --

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, 
IFNULL(SUM(sales.qty), 0) AS TOTAL

FROM authors	
	LEFT JOIN titleauthor 
		ON titleauthor.au_id = authors.au_id
	LEFT JOIN titles
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN sales
		ON titles.title_id = sales.title_id
    
GROUP BY `AUTHOR ID` , `FIRST NAME`, `LAST NAME`
ORDER BY `TOTAL` DESC
;
