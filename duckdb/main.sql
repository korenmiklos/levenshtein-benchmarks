-- Create the 'index' and 'search' tables without predefined IDs
CREATE TABLE IF NOT EXISTS "index" (text VARCHAR);
CREATE TABLE IF NOT EXISTS "search" (query VARCHAR);

-- Import data from 'index.txt' and 'search.txt' into the tables
COPY "index" FROM '../index.txt' (HEADER FALSE, AUTO_DETECT FALSE, DELIMITER '\t', QUOTE '', ESCAPE '');
COPY "search" FROM '../search.txt' (HEADER FALSE, AUTO_DETECT FALSE, DELIMITER '\t', QUOTE '', ESCAPE '');

-- Generate IDs based on row numbers for operations, if needed
WITH indexed_index AS (
    SELECT row_number() OVER () AS id, text
    FROM "index"
),
indexed_search AS (
    SELECT row_number() OVER () AS id, query
    FROM "search"
),
-- Calculate Levenshtein distance for each pair of index and search entries
distance_calculations AS (
    SELECT 
        s.id AS search_id, 
        i.id AS index_id, 
        i.text, 
        levenshtein(i.text, s.query) AS dist
    FROM 
        indexed_search s
    CROSS JOIN 
        indexed_index i
),
-- Rank the results to find the closest match for each search query
ranked_matches AS (
    SELECT 
        *,
        RANK() OVER (PARTITION BY search_id ORDER BY dist ASC) as rank
    FROM 
        distance_calculations
)
-- Select the closest matches based on the Levenshtein distance
SELECT 
    s.query AS search_query, 
    r.text AS closest_match, 
    r.dist AS distance
FROM 
    ranked_matches r
JOIN 
    indexed_search s ON s.id = r.search_id
WHERE 
    r.rank = 1;
