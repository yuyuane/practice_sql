# As a data analyst on the advertiser solutions team at Google, your task is to analyze the performance of various ad campaigns running on Google AdWords for a F500 client. You were asked to find the average cost per click (CPC) for each campaign and each ad group within those campaigns for the previous month. CPC is calculated as the total cost of all clicks divided by the number of clicks.
#
# For this task, you have been given access to the ad_clicks table which stores data about each click on the ads.
#
# ad_clicks Example Input:
# click_id	date	campaign_id	ad_group_id	clicks	cost
# 4325	06/08/2024	1302	2001	50	100.00
# 4637	06/10/2024	1403	2002	65	130.00
# 4876	06/18/2024	1302	2001	70	140.00
# 4531	07/05/2024	1604	3001	80	200.00
# 4749	07/05/2024	1604	2002	75	180.00
# You'd like to return an output table in the following format:
#
# Example Output:
# campaign_id	ad_group_id	avg_CPC
# 1302	2001	2.4
# 1403	2002	2.0
# 1604	3001	2.50
# 1604	2002	2.4
