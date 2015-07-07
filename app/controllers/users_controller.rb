class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @created_bookmarks = current_user.created_bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
