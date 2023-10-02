class Mypage::PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts.all.order(created_at: :desc)
  end

  def show
    @painting = Painting.find(params[:id])
  end
end
