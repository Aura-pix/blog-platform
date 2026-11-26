# Blog Platform API

The API returns JSON. The `posts` resource supports listing posts, creating a post, and retrieving a post by ID.

## `GET /posts`

Returns all posts with `200 OK`. The response is a JSON array; each post has these fields:

```json
[
  {
    "id": 1,
    "title": "A first post",
    "content": "Hello from the Blog Platform API.",
    "published": true,
    "created_at": "2026-11-26T10:00:00.000Z",
    "updated_at": "2026-11-26T10:00:00.000Z"
  }
]
```

`published` is a boolean and defaults to `false` when omitted during creation. `created_at` and `updated_at` are ISO 8601 timestamps.

## `POST /posts`

Create a post by sending a JSON object with a `post` property. The API accepts `title`, `content`, and `published`; `title` and `content` must be present and non-blank.

```json
{
  "post": {
    "title": "A first post",
    "content": "Hello from the Blog Platform API.",
    "published": true
  }
}
```

On success, the response is `201 Created` with the created post and its `id`, `title`, `content`, `published`, `created_at`, and `updated_at` fields.

If `title` or `content` is missing or blank, the response is `422 Unprocessable Entity`:

```json
{
  "errors": {
    "title": ["can't be blank"],
    "content": ["can't be blank"]
  }
}
```

Only the three documented attributes are accepted from the `post` object; other attributes are ignored.

## `GET /posts/:id`

Returns the requested post with `200 OK`, using the same fields as the `POST /posts` success response.

If no post has the requested ID, the response is `404 Not Found`:

```json
{
  "error": "Post not found"
}
```
