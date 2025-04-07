# A phone call is considered an international call when the person calling is in a different country than the person receiving the call.
#
# What percentage of phone calls are international? Round the result to 1 decimal.
#
# Assumption:
#
# The caller_id in phone_info table refers to both the caller and receiver.
# phone_calls Table:
# Column Name	Type
# caller_id	integer
# receiver_id	integer
# call_time	timestamp
# phone_calls Example Input:
# caller_id	receiver_id	call_time
# 1	2	2022-07-04 10:13:49
# 1	5	2022-08-21 23:54:56
# 5	1	2022-05-13 17:24:06
# 5	6	2022-03-18 12:11:49
# phone_info Table:
# Column Name	Type
# caller_id	integer
# country_id	integer
# network	integer
# phone_number	string
# phone_info Example Input:
# caller_id	country_id	network	phone_number
# 1	US	Verizon	+1-212-897-1964
# 2	US	Verizon	+1-703-346-9529
# 3	US	Verizon	+1-650-828-4774
# 4	US	Verizon	+1-415-224-6663
# 5	IN	Vodafone	+91 7503-907302
# 6	IN	Vodafone	+91 2287-664895
# Example Output:
# international_calls_pct
# 50.0
# Explanation
# There is a total of 4 calls with 2 of them being international calls (from caller_id 1 => receiver_id 5, and caller_id 5 => receiver_id 1). Thus, 2/4 = 50.0%
#
# The dataset you are querying against may have different input & output - this is just an example!

SELECT
    round(
                100.0*(sum(case when pinfo.country_id!=pinfo2.country_id then 1 else 0 end)::NUMERIC/count(*)),1)

FROM phone_calls pc
         inner join phone_info pinfo
                    on pc.caller_id=pinfo.caller_id
         inner join phone_info pinfo2
                    on pc.receiver_id=pinfo2.caller_id
;