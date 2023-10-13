class Mypage::BookmarksController < ApplicationController
  def index
    @user = current_user
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end
end
