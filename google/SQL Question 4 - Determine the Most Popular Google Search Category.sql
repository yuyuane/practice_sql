# For this scenario, assume that Google wants to analyze the top searched categories in their platform to optimize their search results. We have two tables, searches which has information about each search, and categories where every category ID is associated with a category name.
#
# The searches table has the following structure:
#
# searches Example Input:
# search_id	user_id	search_date	category_id	query
# 1001	7654	06/01/2024 00:00:00	3001	"chicken recipe"
# 1002	2346	06/02/2024 00:00:00	3001	"vegan meal prep"
# 1003	8765	06/03/2024 00:00:00	2001	"google stocks"
# 1004	9871	07/01/2024 00:00:00	1001	"python tutorial"
# 1005	8760	07/02/2024 00:00:00	2001	"tesla stocks"
# The categories table has the following structure:
#
# categories Example Input:
# category_id	category_name
# 1001	"Programming Tutorials"
# 2001	"Stock Market"
# 3001	"Recipes"
# 4001	"Sports News"
# The question is: Can you write a SQL query that gives the total count of searches made in each category by month for the available data in the year 2024?
#
# Expected output:
#
# Example Output:
# category_name	month	total_searches
# "Programming Tutorials"	07	1
# "Stock Market"	06	1
# "Stock Market"	07	1
# "Recipes"	06	2
