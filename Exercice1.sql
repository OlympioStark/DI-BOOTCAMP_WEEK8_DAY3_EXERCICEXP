--- 1.
SELECT f.title, l.name FROM film f LEFT JOIN language l ON f.language_id = l.language_id;

--- 2.

SELECT f.title, l.name FROM film f RIGHT JOIN language l ON f.language_id = l.language_id;

SELECT f.title, f.description, l.name FROM film f LEFT JOIN language l ON f.language_id = l.language_id;

SELECT f.title, f.description, l.name FROM language l LEFT JOIN film f ON f.language_id = l.language_id;


--- 3.
--- A.
CREATE TABLE new_film(nwfid SERIAL PRIMARY KEY, nwfname VARCHAR(100));
--- B.
INSERT INTO new_film(nwfname)
VALUES ('spiderman no way home'), ('Mission Impossible : Ghost protocol'), ('les stroupfs'), ('Fast and Furious');

--- 4.

CREATE TABLE customer_review(
	cusrid SERIAL,
	title VARCHAR(100),
	score SMALLINT,
	review_text VARCHAR,
	last_update TIMESTAMP,
	PRIMARY KEY(cusrid),
	fk_nwfid INTEGER REFERENCES new_film (nwfid) ON DELETE CASCADE,
	fk_language_id INTEGER REFERENCES language(language_id) ON DELETE CASCADE
);
							
--- 5.

INSERT INTO customer_review(title,score,review_text,last_update,fk_nwfid,fk_language_id)
VALUES ('critique de Maéva', 5, 'rsa', current_timestamp, 1, 1), ('critique de Carine', 9, 'bien', current_timestamp, 2, 2);

SELECT * FROM customer_review;

SELECT * FROM new_film;

DELETE FROM new_film WHERE nwfid = 2;