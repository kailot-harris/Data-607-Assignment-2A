-- DATA 607 - Assignment 2A - SQL Database Input

-- ---------------------------------------------------------
-- 1. Schema
-- ---------------------------------------------------------
-- first, clear out existing tables before entering mock data
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS respondents;

-- create respondent table with respondent_id as primary key
CREATE TABLE respondents (
    respondent_id SERIAL PRIMARY KEY
);
-- create movies table with primary key of movie_id
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- No rating row = that person hasn't seen/rated that movie.
-- create ratings table with rating_id as primary key
CREATE TABLE ratings (
    rating_id SERIAL PRIMARY KEY,
    respondent_id INT NOT NULL REFERENCES respondents(respondent_id),
    movie_id INT NOT NULL REFERENCES movies(movie_id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    UNIQUE (respondent_id, movie_id)
);

-- ---------------------------------------------------------
-- 2. Mock respondents
-- ---------------------------------------------------------
-- insert 7 users into respondent table
INSERT INTO respondents (respondent_id)
VALUES (DEFAULT), (DEFAULT), (DEFAULT), (DEFAULT), (DEFAULT), (DEFAULT), (DEFAULT);


-- ---------------------------------------------------------
-- 3. Movie Titles Insertion 
-- ---------------------------------------------------------
-- insert 9 movies into movie table
INSERT INTO movies (title) VALUES
('One Battle After Another (2025)'),
('Licorice Pizza (2021)'),
('Phantom Thread (2017)'),
('Inherent Vice (2014)'),
('The Master (2012)'),
('There Will Be Blood (2007)'),
('Punch-Drunk Love (2002)'),
('Magnolia (1999)'),
('Boogie Nights (1997)');



-- ---------------------------------------------------------
-- 4. Mock ratings, deliberately incomplete
--    (not every user rated every movie)
-- ---------------------------------------------------------
-- insert mock respondent data (7 users and 9 movies)
INSERT INTO ratings (respondent_id, movie_id, rating) VALUES
(1, 1, 5), (1, 2, 4), (1, 3, 3), (1, 4, 5), (1, 5, 4), (1, 6, 3),(1, 7, 5), (1, 8, 4), (1, 9, 3),
(2, 1, 4), (2, 2, 5), (2, 3, 2), (2, 4, 3), (2, 5, 1), (2, 7, 5), (2, 8, 2), (2, 9, 4),
(3, 1, 3), (3, 3, 5), (3, 5, 4), (3, 7, 3), (3, 9, 5),
(4, 2, 4), (4, 4, 3), (4, 6, 5), (4, 8, 4),
(5, 1, 5), (5, 5, 2), (5, 3, 5), (5, 7, 5), (5, 9, 2),
(6, 3, 4), (6, 2, 4), (6, 4, 4), (6, 5, 4),
(7, 2, 3), (7, 4, 4), (7, 6, 3);