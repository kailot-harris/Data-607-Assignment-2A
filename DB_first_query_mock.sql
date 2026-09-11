-- DATA 607 - Assignment 2A - SQL Database Querying

-- ---------------------------------------------------------
-- 1. Select all data from ratings
-- ---------------------------------------------------------
select * from ratings;

-- ---------------------------------------------------------
-- 2. Output summary table listing how many movies each respondent rated
-- ---------------------------------------------------------
select respondent_id, count(*) as movies_rated
	from ratings
	group by respondent_id
	order by respondent_id;

-- ---------------------------------------------------------
-- 3. Join Two tables
-- ---------------------------------------------------------