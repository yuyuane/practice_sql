# Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.
#
# Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns.
#
# measurements Example Input:
# measurement_id	measurement_value	measurement_time
# 131233	1109.51	07/10/2024 09:00:00
# 135211	1662.74	07/10/2024 11:00:00
# 523542	1246.24	07/10/2024 13:15:00
# 143562	1124.50	07/11/2024 15:00:00
# 346462	1234.14	07/11/2024 16:45:00
# Example Output:
# measurement_day	odd_sum	even_sum
# 07/10/2024 00:00:00	2355.75	1662.74
# 07/11/2024 00:00:00	1124.50	1234.14
# Example Explanation
# Based on the results,
#
# On 07/10/2024, the sum of the odd-numbered measurements is 2355.75, while the sum of the even-numbered measurements is 1662.74.
# On 07/11/2024, there are only two measurements available. The sum of the odd-numbered measurements is 1124.50, and the sum of the even-numbered measurements is 1234.14.

-- the same with datalemur Odd and Even Measurements - Google SQL Interview Question
with n as (
    SELECT *,date_trunc('day',measurement_time) as daydate
         ,row_number() over(partition by date_trunc('day',measurement_time) order by measurement_time asc) as row_num
    FROM measurements
) select daydate,
         sum(case when row_num%2=0 then measurement_value else 0 end) as even_sum,
         sum(case when row_num%2=0 then 0 else measurement_value end) as odd_sum
from n group by daydate;

