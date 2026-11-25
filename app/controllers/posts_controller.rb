class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors.to_hash }, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find_by(id: params[:id])

    if post
      render json: post
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published)
  end
end
