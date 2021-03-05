USE lab;

-- CHALLENGE 1 --
SELECT a.au_id AS `AUTHORS ID`,
		`au_lname` AS `LAST NAME`,
        `au_fname` AS `FIRST NAME`,
        `title` AS `TITLE`,
        `pub_name` AS `PUBLISHER`
        
	FROM `authors` AS a
    
		JOIN `titleauthor` AS ta
ON ta.au_id = a.au_id
		JOIN `titles`AS t
ON ta.title_id = t.title_id
		JOIN `publishers` AS p
ON t.pub_id = p.pub_id
;

SELECT a.au_id AS `AUTHORS ID`,
		`au_lname` AS `LAST NAME`,
        `au_fname` AS `FIRST NAME`,
        `pub_name` AS `PUBLISHER`,
        count(distinct `title`) AS `TITLE`
        
	FROM `authors` AS a
    
		JOIN `titleauthor` AS ta
ON ta.au_id = a.au_id
		JOIN `titles`AS t
ON ta.title_id = t.title_id
		JOIN `publishers` AS p
ON t.pub_id = p.pub_id

GROUP BY a.au_id, p.pub_name
ORDER BY a.au_id DESC
;

-- CHALLENGE 3 --
SELECT a.au_id AS `AUTHORS ID`,
		`au_lname` AS `LAST NAME`,
        `au_fname` AS `FIRST NAME`,
        count(`title`) AS `TITLE`
        
	FROM `authors` AS a
    
		JOIN `titleauthor` AS ta
ON ta.au_id = a.au_id
		JOIN `titles`AS t
ON ta.title_id = t.title_id
		JOIN `sales` AS s
ON t.title_id = s.title_id

GROUP BY a.au_id
ORDER BY title DESC
LIMIT 3
;

-- CHALLENGE 4 --
SELECT a.au_id AS `AUTHORS ID`,
		`au_lname` AS `LAST NAME`,
        `au_fname` AS `FIRST NAME`,
        count(ifnull(`title`, 0)) AS `TITLE`
	FROM `authors` AS a
		JOIN `titleauthor` AS ta
ON ta.au_id = a.au_id
		JOIN `titles`AS t
ON ta.title_id = t.title_id
		JOIN `sales` AS s
ON t.title_id = s.title_id

GROUP BY a.au_id, t.title
ORDER BY title DESC
-- NO ME SALEN NULOS; EN EL EJERCICIO PONE QUE DEBEN SALIR 23 ROWS Y ME SALEN 24... --
;