class Mypage::BookmarksController < ApplicationController
  def index
    @user = current_user
    @bookmarks = Bookmark.all
  end
end
