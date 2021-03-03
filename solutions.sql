-- CHALLENGE1

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name
AS PUBLISHER
FROM authors as a
    INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
    INNER JOIN titles as t ON ta.title_id = t.title_id
    INNER JOIN publishers as p ON p.pub_id = t.pub_id
order by a a.au_id asc;

SELECT count(*) as ta FROM titleauthor;

SELECT 	COUNT(*) as a FROM (
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name
AS PUBLISHER
FROM authors as a
    INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
    INNER JOIN titles as t ON ta.title_id = t.title_id
    INNER JOIN publishers as p ON p.pub_id = t.pub_id) AS TABLA;
  
-- CHALLENGE2
  
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, count(t.title) AS "TITLE COUNT", p.pub_name
AS PUBLISHER
FROM authors as a
    INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
    INNER JOIN titles as t ON ta.title_id = t.title_id
    INNER JOIN publishers as p ON p.pub_id = t.pub_id
GROUP BY a.au_id, p.pub_id
ORDER BY a.au_id desc;

-- CHALLENGER3
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, count(t.title) AS TOTAL
FROM authors as a
    INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
    INNER JOIN titles as t ON ta.title_id = t.title_id
    INNER JOIN publishers as p ON p.pub_id = t.pub_id
GROUP BY a.au_id 
ORDER BY TOTAL DESC
limit 3;

-- CHALLENGE4
SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, count(t.title) AS TOTAL
FROM authors as a
    LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
    LEFT JOIN titles as t ON ta.title_id = t.title_id
    LEFT JOIN publishers as p ON p.pub_id = t.pub_id
GROUP BY a.au_id 
ORDER BY TOTAL ASC;

-- Bonus Challenge - Most Profiting Authors

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, 
SUM(t.advance+((t.royalty/100)*t.ytd_sales*t.price))*(ta.royaltyper/100)
AS PROFIT
FROM authors as a
    INNER JOIN titleauthor as ta ON a.au_id = ta.au_id
    INNER JOIN titles as t ON ta.title_id = t.title_id
      
group by AUTHOR_ID
ORDER BY PROFIT DESC
LIMIT 3;