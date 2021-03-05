USE `sakila`;

SELECT COUNT(*) FROM `titleauthor`;
#25 rows

-- challenge 1
-- we need to create a subquery in order to count in a no-existing-table(newtable)
SELECT COUNT(1) FROM 
(SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, titles.title AS `TITLE`, publishers.pub_name AS `PUBLISHER`
FROM 
	`titles`
    JOIN
    `publishers`
    ON 
    publishers.pub_id=titles.pub_id
    JOIN 
    `titleauthor`
	ON
    titles.title_id=titleauthor.title_id
    JOIN
    `authors`
    ON
    authors.au_id=titleauthor.au_id) AS newtable;
    
-- challenge 2
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, publishers.pub_name AS `PUBLISHER`, COUNT(titles.title) AS `TITLE COUNT`

FROM 
	`titles`
    JOIN
    `publishers`
    ON 
    publishers.pub_id=titles.pub_id
    JOIN 
    `titleauthor`
	ON
    titles.title_id=titleauthor.title_id
    JOIN
    `authors`
    ON
    authors.au_id=titleauthor.au_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST NAME`,`PUBLISHER`
ORDER BY `TITLE COUNT` DESC, `AUTHOR ID` DESC;

-- challenge 3

SELECT * FROM sales;
SELECT * FROM titles;

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, SUM(sales.qty) AS `TOTAL`

FROM 
	`titles`
    JOIN
    `sales`
    ON 
    sales.title_id=titles.title_id
    JOIN 
    `titleauthor`
	ON
    titles.title_id=titleauthor.title_id
    JOIN
    `authors`
    ON
    authors.au_id=titleauthor.au_id

-- TOTAL is the number of titles sold by authors, but in the "hint" it talks about the total profits, should we have in consideration also the price per title?
GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST NAME`
ORDER BY `TOTAL`DESC
LIMIT 3;

-- CHALLENGE 4

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, IFNULL(SUM(sales.qty), 0) AS `TOTAL`

FROM 
	`titles`
    JOIN
    `sales`
    ON 
    sales.title_id=titles.title_id
    JOIN 
    `titleauthor`
	ON
    titles.title_id=titleauthor.title_id
    RIGHT JOIN
    `authors`
    ON
    authors.au_id=titleauthor.au_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST NAME`
ORDER BY `TOTAL`DESC;

-- BONUS

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, SUM(sales.qty*titles.price*titleauthor.royaltyper) AS `PROFIT`

FROM 
	`titles`
    JOIN
    `sales`
    ON 
    sales.title_id=titles.title_id
    JOIN 
    `titleauthor`
	ON
    titles.title_id=titleauthor.title_id
    RIGHT JOIN
    `authors`
    ON
    authors.au_id=titleauthor.au_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST NAME`
ORDER BY `PROFIT`DESC
LIMIT 3; 


