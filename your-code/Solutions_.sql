-- challenge1 --
use car_store_2;

SELECT authors.au_id as 'AUTHOR ID', au_lname as LAST_NAME, au_fname as 'FIRST NAME', title as 'TITLE', pub_name as 'PUBLISHER'
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
on publishers.pub_id = titles.pub_id
;



-- Challenge2 --

use car_store_2;

SELECT authors.au_id as `AUTHOR ID`, au_lname as `LAST_NAME`, au_fname as `FIRST NAME`, pub_name as `PUBLISHER`, 
COUNT(pub_name) AS `TITLE COUNT`

FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
on publishers.pub_id = titles.pub_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST_NAME`, `PUBLISHER`
ORDER BY `TITLE COUNT` DESC, `AUTHOR ID` DESC;

SELECT COUNT(*) FROM `titleauthor`;
SELECT COUNT(*) FROM `TITLE COUNT`;

-- Challenge 3 --

use car_store_2;


SELECT authors.au_id as `AUTHOR ID`, au_lname as `LAST_NAME`, au_fname as `FIRST NAME`,
SUM(sales.qty) AS `TOTAL`

FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN sales
ON sales.title_id = titles.title_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST_NAME`
ORDER BY `TOTAL` DESC
LIMIT 3;


-- Challenge 4 --

SELECT authors.au_id as `AUTHOR ID`, au_lname as `LAST_NAME`, au_fname as `FIRST NAME`,
IFNULL(SUM(sales.qty),0) AS `TOTAL`

FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titles.title_id = titleauthor.title_id 
LEFT JOIN sales ON sales.title_id = titles.title_id

GROUP BY `AUTHOR ID`, `FIRST NAME`, `LAST_NAME`
ORDER BY `TOTAL` DESC;

SELECT COUNT(*) FROM authors;
