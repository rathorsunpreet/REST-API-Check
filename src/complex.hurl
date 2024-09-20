# Complex Situation
GET {{host}}/api/users?page={{id}}
[Options]
variable: host=https://reqres.in
variable: id=1
HTTP 200
[Captures]
user_id: jsonpath "$.data[1].id"
email: jsonpath "$.data[1].email"

GET {{host}}/api/users/{{user_id}}
HTTP 200
[Asserts]
jsonpath "$.data.email" contains "janet.weaver"