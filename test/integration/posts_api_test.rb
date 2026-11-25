require "test_helper"

class PostsApiTest < ActionDispatch::IntegrationTest
  setup do
    Post.delete_all
  end

  test "index returns all posts as JSON" do
    post = Post.create!(title: "First post", content: "Hello", published: true)

    get posts_url, as: :json

    assert_response :success
    assert_equal [ post.id ], response.parsed_body.map { |item| item.fetch("id") }
  end

  test "create stores a post and returns it as JSON" do
    assert_difference("Post.count", 1) do
      post posts_url, params: {
        post: { title: "First post", content: "Hello", published: true }
      }, as: :json
    end

    assert_response :created
    assert_equal "First post", response.parsed_body.fetch("title")
    assert_equal true, response.parsed_body.fetch("published")
  end

  test "create returns validation errors with status 422" do
    post posts_url, params: {
      post: { title: "", content: "", published: false }
    }, as: :json

    assert_response :unprocessable_entity
    assert_equal(
      { "title" => [ "can't be blank" ], "content" => [ "can't be blank" ] },
      response.parsed_body.fetch("errors")
    )
  end

  test "show returns an existing post" do
    post = Post.create!(title: "First post", content: "Hello")

    get post_url(post), as: :json

    assert_response :success
    assert_equal post.id, response.parsed_body.fetch("id")
  end

  test "show returns 404 for a missing post" do
    get post_url(id: "missing"), as: :json

    assert_response :not_found
    assert_equal({ "error" => "Post not found" }, response.parsed_body)
  end
end
