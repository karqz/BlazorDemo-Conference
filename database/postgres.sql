CREATE TABLE author (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL
);

INSERT INTO author (name, surname)
VALUES 
	('Filip', 'Murlak'),
	('Krzysztof', 'Stencel'),
	('Krzysztof', 'Ciebiera'),
	('Edgar', 'Codd'),
	('Raymond', 'Boyce');
	
CREATE TABLE paper (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(1023) NOT NULL,
    classification VARCHAR(1023) NOT NULL
);

INSERT INTO paper (name, classification)
VALUES
	('Stackless Processing of Streamed Trees', 'Databases'),
	('A Relational Model of Data for Large Shared Data Banks', 'Databases'),
	('SEQUEL: A Structured English Query Language', 'Programming Languages'),
	('How to Match Jobs and Candidates - A Recruitment Support System Based on Feature Engineering and Advanced Analytics.', 'Recommender systems');
	
-- SESSION is also a keyword. To tell SQL that we mean the table name,
-- put it in double quotes. Same applies for WHEN as a keyword and column name.
CREATE TABLE "session" (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "when" TIMESTAMP(0) NOT NULL, -- TIMESTAMP is the DATETIME in Postgres
                                  -- The argument is the precision of seconds. 
	                          -- 0 means 0 after decimal point, so up to a second.
    chair_id INTEGER REFERENCES author NOT NULL
);

CREATE TABLE paper_author (
	author_id INTEGER REFERENCES author NOT NULL,
	paper_id INTEGER REFERENCES paper NOT NULL,
	CONSTRAINT paper_paper_id_author_id_pkey PRIMARY KEY (paper_id, author_id)
);

INSERT INTO paper_author (author_id, paper_id) VALUES
	(1, 1),
	(2, 4),
	(3, 2),
	(4, 3),
	(5, 4);
