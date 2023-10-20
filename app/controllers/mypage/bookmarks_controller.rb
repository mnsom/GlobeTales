class Mypage::BookmarksController < ApplicationController
  def index
    @user = current_user
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    if @bookmark.save
      render json: { success: true }
    else
      render json: { success: false, errors: @bookmark.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:name)
  end
end
