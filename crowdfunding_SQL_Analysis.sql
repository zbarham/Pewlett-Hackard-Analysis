-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, sum(backers_count) AS backer_counts
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY backer_counts DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, COUNT(*) AS backer_counts
FROM backers
GROUP BY cf_id
ORDER BY backer_counts DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
CREATE TABLE email_contacts_remaining_goal_amount AS
SELECT b.first_name, b.last_name, b.email, c.goal - c.pledged AS amount_left
FROM backers b
JOIN campaign c ON b.cf_id = c.cf_id
WHERE c.outcome = 'live'
ORDER BY c.goal - c.pledged DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
CREATE TABLE email_backers_remaining_goal_amount AS
SELECT b.email, b.first_name, b.last_name, b.cf_id, c.company_name, c.description, c.end_date, c.goal - c.pledged AS "Left of Goal"
FROM backers b
JOIN campaign c ON b.cf_id = c.cf_id
ORDER BY b.email DESC;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;