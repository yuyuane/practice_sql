# Table: Users
#
# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | user_id     | int     |
# | user_name   | varchar |
# +-------------+---------+
# user_id is the primary key (column with unique values) for this table.
# Each row of this table contains the name and the id of a user.
#
#
# Table: Register
#
# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | contest_id  | int     |
# | user_id     | int     |
# +-------------+---------+
# (contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
# Each row of this table contains the id of a user and the contest they registered into.
#
#
# Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
#
# Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
#
# The result format is in the following example.
#
#
#
# Example 1:
#
# Input:
# Users table:
# +---------+-----------+
# | user_id | user_name |
# +---------+-----------+
# | 6       | Alice     |
# | 2       | Bob       |
# | 7       | Alex      |
# +---------+-----------+
# Register table:
# +------------+---------+
# | contest_id | user_id |
# +------------+---------+
# | 215        | 6       |
# | 209        | 2       |
# | 208        | 2       |
# | 210        | 6       |
# | 208        | 6       |
# | 209        | 7       |
# | 209        | 6       |
# | 215        | 7       |
# | 208        | 7       |
# | 210        | 2       |
# | 207        | 2       |
# | 210        | 7       |
# +------------+---------+
# Output:
# +------------+------------+
# | contest_id | percentage |
# +------------+------------+
# | 208        | 100.0      |
# | 209        | 100.0      |
# | 210        | 100.0      |
# | 215        | 66.67      |
# | 207        | 33.33      |
# +------------+------------+
# Explanation:
# All the users registered in contests 208, 209, and 210. The percentage is 100% and we sort them in the answer table by contest_id in ascending order.
# Alice and Alex registered in contest 215 and the percentage is ((2/3) * 100) = 66.67%
# Bob registered in contest 207 and the percentage is ((1/3) * 100) = 33.33%

# Write your MySQL query statement below
-- round(2), order desc,asc
-- 查询所有用户对于contest来说的注册率
#
# select *
# from Users u
#          left join Register r
#                    on u.user_id=r.user_id
# order by r.contest_id ,u.user_id;


with n1 as (
    select * from (select distinct contest_id from Register) newr,Users
) select
      n1.contest_id, round(count(r.contest_id)/count(1),4)*100 as percentage
from n1 left join Register r
                  on n1.contest_id=r.contest_id and n1.user_id=r.user_id
group by n1.contest_id
order by round(count(r.contest_id)/count(1),4)*100 desc, n1.contest_id asc;

