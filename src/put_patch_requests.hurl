# Run these commands before executing this test case
# export/set HURL_host=https://reqres.in
# export/set HURL_body={\"name\": "morpheus\",\"job\": \"zion resident\"}
# export/set HURL_id=2

# PUT - PATCH Requests
# PUT Update Enpoint
PUT {{host}}/api/users/{{id}}
```
{{body}}
```
HTTP 200
[Asserts]
jsonpath "$.updatedAt" contains "2024"

# PATCH Update Enpoint
PUT {{host}}/api/users/{{id}}
```
{{body}}
```
HTTP 200