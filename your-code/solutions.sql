USE `sakila`;

SELECT COUNT(*) FROM `titleauthor`;
#25 rows

SELECT `authors.au_id` AS `AUTHOR ID`, `authors.au_lname` AS `LAST NAME`, 
`authors.au_fname` AS `FIRST NAME`, `titles.title` AS `TITLE`, `publishers.pub_name` AS `PUBLISHER`
FROM 
	`publishers`
    JOIN
    `titles`
    ON 
    `publishers.pub_id`=`titles.pub_id`
    JOIN 
    `titleauthor`
	ON
    `title.title_id`=`titleauthor.title_id`
    JOIN
    `authors`
    ON
    `authors.au_id`=`title.au_id`;
    

#Error Code: 1054. Unknown column 'authors.au_id' in 'field list'
