# This is the same question as problem #10 in the SQL Chapter of Ace the Data Science Interview!
#
# Given a table of tweet data over a specified time period, calculate the 3-day rolling average of tweets for each user. Output the user ID, tweet date, and rolling averages rounded to 2 decimal places.
#
# Notes:
#
# A rolling average, also known as a moving average or running mean is a time-series technique that examines trends in data over a specified period of time.
# In this case, we want to determine how the tweet count for each user changes over a 3-day period.
# Effective April 7th, 2023, the problem statement, solution and hints for this question have been revised.
#
# tweets Table:
# Column Name	Type
# user_id	integer
# tweet_date	timestamp
# tweet_count	integer
# tweets Example Input:
# user_id	tweet_date	tweet_count
# 111	06/01/2022 00:00:00	2
# 111	06/02/2022 00:00:00	1
# 111	06/03/2022 00:00:00	3
# 111	06/04/2022 00:00:00	4
# 111	06/05/2022 00:00:00	5
# Example Output:
# user_id	tweet_date	rolling_avg_3d
# 111	06/01/2022 00:00:00	2.00
# 111	06/02/2022 00:00:00	1.50
# 111	06/03/2022 00:00:00	2.00
# 111	06/04/2022 00:00:00	2.67
# 111	06/05/2022 00:00:00	4.00
# The dataset you are querying against may have different input & output - this is just an example!

SELECT user_id,tweet_date,
       round(
               avg(tweet_count) over(PARTITION by user_id order by tweet_date asc range between interval '2 days' PRECEDING and CURRENT row)
           ,2
           )
           as rolling_avg_3d

FROM tweets;

