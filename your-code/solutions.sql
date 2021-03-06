-- Challenge 1 --
USE publications;
SELECT authors.`au_id`, authors.`au_lname`, authors.`au_fname`, titles.`title`, publishers.`pub_name`
FROM authors

JOIN titleauthor
ON authors.au_id = titleauthor.au_id

JOIN titles
ON titles.title_id = titleauthor.title_id

JOIN publishers
ON publishers.pub_id = titles.pub_id
;

-- Challenge 2 --
USE publications;

SELECT authors.'au_id' AS 'Author ID', 'au_lname' AS 'LAST NAME', 'au_fname' AS 'FIRST NAME', 'pub_name' AS 'PUBLISHER',
COUNT('pub_name') AS 'TITLE COUNT'
FROM 'authors'
JOIN 'titleauthor' AS 'ta'
ON 'ta'.'au_id' = 'authors'.'au_id' 
JOIN 'titles' 
ON 'titles'.'title_id' = 'ta'.'title_id'
JOIN 'publishers' AS 'p'
ON 'p'.'pub_id' = 'titles'.'pub_id'
GROUP BY 'titles'.'title_id'
ORDER BY 'AUTHOR ID' DESC;
