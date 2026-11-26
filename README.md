# Blog Platform

A small JSON API for creating and reading blog posts, built with Ruby on Rails 8.1 and SQLite.

This repository was created to test documentation tooling and documentation updates. The API reference is in [docs/api.md](docs/api.md).

## Run locally

Requirements: Ruby 3.4.13 and SQLite.

```sh
bundle install
bin/rails db:prepare
bin/rails server
```

Run the test suite with `bin/rails test`.
