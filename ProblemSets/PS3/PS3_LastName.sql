-- Problem Set 3 SQL script
-- This script imports the Florida insurance sample CSV and answers the required questions.

.print ' '
.print 'Importing data'
-- Create the table to hold the CSV data
CREATE TABLE insurance (
    policyID INTEGER,
    statecode TEXT,
    county TEXT,
    eq_site_limit REAL,
    hu_site_limit REAL,
    fl_site_limit REAL,
    fr_site_limit REAL,
    tiv_2011 REAL,
    tiv_2012 REAL,
    eq_site_deductible REAL,
    hu_site_deductible REAL,
    fl_site_deductible REAL,
    fr_site_deductible REAL,
    point_latitude REAL,
    point_longitude REAL,
    line TEXT,
    construction TEXT,
    point_granularity INTEGER
);

.mode csv
.headers on
.import FL_insurance_sample.csv insurance

-- Remove the header row inserted during import
DELETE FROM insurance WHERE policyID IS NULL OR policyID = 'policyID';

.print ' '
.print 'First 10 rows'
SELECT * FROM insurance LIMIT 10;

.print ' '
.print 'Counties in sample'
SELECT DISTINCT county FROM insurance;

.print ' '
.print 'Average appreciation'
SELECT AVG(tiv_2012 - tiv_2011) AS avg_appreciation
FROM insurance;

.print ' '
.print 'Construction frequency'
SELECT construction,
       COUNT(*) AS count,
       ROUND(1.0 * COUNT(*) / (SELECT COUNT(*) FROM insurance), 4) AS share
FROM insurance
GROUP BY construction
ORDER BY count DESC;
