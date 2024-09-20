# Use the command-line parameter --variable host=https://reqres.in --variable valid=2 --variable invalid=23 --variable delayed=3
# GET Requests only
# List Users Endpoint
GET {{host}}/api/users?page={{valid}}
HTTP 200
[Asserts]
jsonpath "$.data" count == 6

# Single User Endpoint
# Successful Check
GET {{host}}/api/users/{{valid}}
HTTP 200
[Asserts]
jsonpath "$.data.first_name" == "Janet"
jsonpath "$.data.last_name" == "Weaver"

# User Not Found Check
GET {{host}}/api/users/{{invalid}}
HTTP 404
[Asserts]
jsonpath "$" isEmpty

# List<Resource> Endpoint
GET {{host}}/api/unknown
HTTP 200
[Asserts]
jsonpath "$.total" == 12
jsonpath "$.total_pages" == 2

# Single<Resource> Endpoint
# Successful Check
GET {{host}}/api/unknown/{{valid}}
HTTP 200
[Asserts]
jsonpath "$.support.url" contains "support-heading"

# Not Found Check
GET {{host}}/api/unknown/{{invalid}}
HTTP 404
[Asserts]
jsonpath "$" != null

# Delayed Response Endpoint
GET {{host}}/api/users?delay={{delayed}}
HTTP 200
[Asserts]
jsonpath "$.page" == 1