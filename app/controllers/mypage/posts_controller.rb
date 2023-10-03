class Mypage::PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.all.order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to mypage_posts_path, notice: "Post deleted successfully"
  end

  def show
    @post = Post.find(params[:id])
  end
end
