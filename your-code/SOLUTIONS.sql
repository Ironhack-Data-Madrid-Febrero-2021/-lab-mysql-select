--- Challenge1 ---

USE publications;

SELECT titleauthor.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, title AS TITLE, pub_name AS PUBLISHER

FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id;

--- Challenge2 ---

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, pub_name AS PUBLISHER, COUNT(pub_name) AS `TITLE COUNT`

FROM authors

JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id=titleauthor.title_id
JOIN publishers ON publishers.pub_id=titles.pub_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST NAME`, `PUBLISHER`
ORDER BY `TITLE COUNT` DESC, `AUTHOR ID` DESC
;

SELECT COUNT(*) FROM `titleauthor`;

--- Challenge3 ---

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, SUM(sales.qty) AS TOTAL

FROM authors

JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id=titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST NAME`
ORDER BY `TOTAL` DESC
LIMIT 3
;

--- Challenge4 ---

SELECT authors.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, IFNULL(SUM(sales.qty),0) AS TOTAL

FROM authors

LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id=titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST NAME`
ORDER BY `TOTAL` DESC
;
SELECT COUNT(*) FROM authors;
 