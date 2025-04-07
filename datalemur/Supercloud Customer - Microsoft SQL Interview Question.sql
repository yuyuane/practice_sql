# A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table.
#
# Write a query that identifies the customer IDs of these Supercloud customers.
#
# customer_contracts Table:
# Column Name	Type
# customer_id	integer
# product_id	integer
# amount	integer
# customer_contracts Example Input:
# customer_id	product_id	amount
# 1	1	1000
# 1	3	2000
# 1	5	1500
# 2	2	3000
# 2	6	2000
# products Table:
# Column Name	Type
# product_id	integer
# product_category	string
# product_name	string
# products Example Input:
# product_id	product_category	product_name
# 1	Analytics	Azure Databricks
# 2	Analytics	Azure Stream Analytics
# 4	Containers	Azure Kubernetes Service
# 5	Containers	Azure Service Fabric
# 6	Compute	Virtual Machines
# 7	Compute	Azure Functions
# Example Output:
# customer_id
# 1
# Explanation:
# Customer 1 bought from Analytics, Containers, and Compute categories of Azure, and thus is a Supercloud customer. Customer 2 isn't a Supercloud customer, since they don't buy any container services from Azure.
#
# The dataset you are querying against may have different input & output - this is just an example!

with n as (
    select c.customer_id,
           count(DISTINCT p.product_category) as num,
           (select count(DISTINCT product_category) from products ) as total_p
    from customer_contracts c inner join products p on c.product_id=p.product_id
    group by c.customer_id
) select customer_id from n where num=total_p;
;


