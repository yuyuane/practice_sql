# New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.
#
# A senior analyst is interested to know the activation rate of specified users in the emails table. Write a query to find the activation rate. Round the percentage to 2 decimal places.
#
# Definitions:
#
# emails table contain the information of user signup details.
# texts table contains the users' activation information.
# Assumptions:
#
# The analyst is interested in the activation rate of specific users in the emails table, which may not include all users that could potentially be found in the texts table.
# For example, user 123 in the emails table may not be in the texts table and vice versa.
# Effective April 4th 2023, we added an assumption to the question to provide additional clarity.
#
# emails Table:
# Column Name	Type
# email_id	integer
# user_id	integer
# signup_date	datetime
# emails Example Input:
# email_id	user_id	signup_date
# 125	7771	06/14/2022 00:00:00
# 236	6950	07/01/2022 00:00:00
# 433	1052	07/09/2022 00:00:00
# texts Table:
# Column Name	Type
# text_id	integer
# email_id	integer
# signup_action	varchar
# texts Example Input:
# text_id	email_id	signup_action
# 6878	125	Confirmed
# 6920	236	Not Confirmed
# 6994	236	Confirmed
# 'Confirmed' in signup_action means the user has activated their account and successfully completed the signup process.
#
# Example Output:
# confirm_rate
# 0.67
# Explanation:
# 67% of users have successfully completed their signup and activated their accounts. The remaining 33% have not yet replied to the text to confirm their signup.
#
# The dataset you are querying against may have different input & output - this is just an example!

with n as (
    SELECT *,
           row_number() over(partition by e.email_id order by e.email_id desc, t.text_id desc) as row_num
    FROM emails e left join
         texts t on e.email_id=t.email_id order by e.email_id desc, t.text_id desc
)
select
    round(
            sum(case when signup_action='Confirmed' then 1 else 0 end)::NUMERIC/count(*)
        ,2
        ) as confirm_rate
from n where row_num =1;
;