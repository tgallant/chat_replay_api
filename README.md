# ChatReplayApi

## Heroku URL

https://chat-replay-api.herokuapp.com/

## Examples

### Create New Message

`POST /api/messages {body: 'string', replay_time: 'float', topic: 'string', user: 'string'}`
```
$ http POST https://chat-replay-api.herokuapp.com/api/messages body=hi456 replay_time=6.7 topic=a1b2c3 user=someone
HTTP/1.1 201 Created
Cache-Control: max-age=0, private, must-revalidate
Connection: keep-alive
Content-Length: 84
Content-Type: application/json; charset=utf-8
Date: Sun, 25 Mar 2018 01:20:45 GMT
Location: /api/messages/2
Server: Cowboy
Strict-Transport-Security: max-age=31536000
Via: 1.1 vegur
X-Request-Id: 5bd20b42-ce3b-43d0-9fa6-4a5756bf4ff8

{
    "data": {
        "body": "hi456",
        "id": 2,
        "replay_time": 6.7,
        "topic": "a1b2c3",
        "user": "someone"
    }
}
```

### Get messages by topic

`GET /api/messages/:topic`
```
$ http GET https://chat-replay-api.herokuapp.com/api/messages/a1b2c3
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Connection: keep-alive
Content-Length: 158
Content-Type: application/json; charset=utf-8
Date: Sun, 25 Mar 2018 01:21:35 GMT
Server: Cowboy
Strict-Transport-Security: max-age=31536000
Via: 1.1 vegur
X-Request-Id: da7743b0-92e3-4a62-a74d-7db46dc5641a

{
    "data": [
        {
            "body": "hi123",
            "id": 1,
            "replay_time": 5.3,
            "topic": "a1b2c3",
            "user": "tim"
        },
        {
            "body": "hi456",
            "id": 2,
            "replay_time": 6.7,
            "topic": "a1b2c3",
            "user": "someone"
        }
    ]
}
```

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
