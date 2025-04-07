# As a Data Analyst on the Google Maps User Generated Content team, you and your Product Manager are investigating user-generated content (UGC) – photos and reviews that independent users upload to Google Maps.
#
# Write a query to determine which type of place (place_category) attracts the most UGC tagged as "off-topic". In the case of a tie, show the output in ascending order of place_category.
#
#     place_info Example Input:
#     place_id	place_name	place_category
#     1	Baar Baar	Restaurant
#     2	Rubirosa	Restaurant
#     3	Mr. Purple	Bar
#     4	La Caverna	Bar
#     maps_ugc_review Example Input:
#     content_id	place_id	content_tag
#     101	1	Off-topic
#     110	2	Misinformation
#     153	2	Off-topic
#     176	3	Harassment
#     190	3	Off-topic
#     Example Output:
#     off_topic_places
#     Restaurant
#     The restaurants (Baar Baar and Rubirosa) have a total of has 2 UGC posts tagged as "off-topic". The bars only have 1. Restaurant is shown here because it's the type of place with the most UGC tagged as "off-topic".