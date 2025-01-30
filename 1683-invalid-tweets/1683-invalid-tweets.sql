/* Write your T-SQL query statement */
SELECT tweet_id
FROM Tweets
WHERE LEN(Content) > 15