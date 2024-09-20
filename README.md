# REST-API-Check

Testing REST API, [Reqres.in](https://reqres.in) using [Hurl](https://hurl.dev/).

## Installation
Manually download the project.

## Usage

```cmd
# To execute hurl files, use
hurl --test filename.txt

# To execute all hurl files in a folder, use
hurl --test folder\*.hurl
or 
hurl --test folder

# To execute get_requests.hurl, use
hurl --variable host=https://reqres.in --variable valid=2 \
--variable invalid=23 --variable delayed=3 \
--test src\get_requests.hurl

# To execute post_requests.hurl, use
hurl --variable-file Resources\post.env --test src\post_requests.hurl

# To execute put_patch_requests.hurl, use
# Use "export" for Linux and "set" for Windows
export/set HURL_host=https://reqres.in
export/set HURL_body={\"name\": "morpheus\",\"job\": \"zion resident\"}
export/set HURL_id=2
hurl --test src\put_patch_requests.hurl

# To execute delete_requests.hurl, use
hurl --test src\delete_requests.hurl

# To execute complex.hurl, use
hurl --test src\complex.hurl
```

## Note

All of the usage commands must be issued from project root.

## License

[MIT](https://choosealicense.com/licenses/mit/)