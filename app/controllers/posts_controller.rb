class PostsController < ApplicationController
  def index
    @posts =
      if params[:q].present?
        Post.global_search(params[:q])
      else
        @posts = Post.all
      end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
end
