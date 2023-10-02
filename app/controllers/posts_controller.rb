class PostsController < ApplicationController
  def index
    @posts =
      if params[:q].present?
        Post.global_search(params[:q]).order(created_at: :desc)
      else
        @posts = Post.all.order(created_at: :desc)
      end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :location, category: [], photos: [])
  end
end
