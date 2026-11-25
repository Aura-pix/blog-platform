# Blog Platform API

A JSON API for creating and reading blog posts.

## Requirements and setup

- Ruby 3.4.13
- SQLite

Install dependencies, create the database, and run migrations:

```sh
bundle install
bin/rails db:prepare
```

Start the API with `bin/rails server`. Run the test suite with `bin/rails test`.

## Endpoints

| Method | Path | Description |
| --- | --- | --- |
| `GET` | `/posts` | List all posts |
| `POST` | `/posts` | Create a post |
| `GET` | `/posts/:id` | Show one post |

### Create a post

Send a JSON request with a `post` object containing exactly these fields:

```json
{
  "post": {
    "title": "A first post",
    "content": "Hello from the Blog Platform API.",
    "published": true
  }
}
```

The `published` value is a JSON boolean. A successful request returns `201 Created` with the post, including its `id`, `title`, `content`, `published`, `created_at`, and `updated_at` fields.

If `title` or `content` is missing or blank, the API responds with `422 Unprocessable Entity`:

```json
{
  "errors": {
    "title": ["can't be blank"],
    "content": ["can't be blank"]
  }
}
```

Looking up an unknown post returns `404 Not Found`:

```json
{
  "error": "Post not found"
}
```
