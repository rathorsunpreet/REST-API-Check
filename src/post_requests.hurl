# Use the command-line parameter --variables-file Resources\post.env
# POST Requests
# Create Endpoint
POST {{host}}/api/users
```
{{body}}
```
HTTP 201
[Asserts]
jsonpath "$.createdAt" contains "2024"

# Register Endpoint
# Register - Successful Check
POST {{host}}/api/register
{
    "email": "{{valid_email}}",
    "password": "{{password}}"
}
HTTP 200
[Asserts]
jsonpath "$.token" exists


# Register - Unsuccessful
POST {{host}}/api/register
{
    "email": "{{invalid_email}}"
}
HTTP 400
[Asserts]
jsonpath "$.error" == "Missing password"

# Login Endpoint
# Login - Successful Check
POST {{host}}/api/login
{
    "email": "{{valid_email}}",
    "password": "{{password1}}"
}
HTTP 200
[Asserts]
jsonpath "$.token" == "QpwL5tke4Pnpja7X4"

# Login - Unsuccessful Check
POST {{host}}/api/login
{
    "email": "{{invalid_email1}}"
}
HTTP 400
[Asserts]
jsonpath "$.error" exists