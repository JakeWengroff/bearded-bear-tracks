class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show  
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)
    @bookmark.user = User.find(current_user.id)
    if @bookmark.save
      flash[:notice] = "Bookmark was successfully saved."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end
  
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
       redirect_to @bookmark
     else
       flash[:error] = "Error saving bookmark. Please try again."
       render :edit
     end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @user = @bookmark.user
    if @bookmark.destroy
      redirect_to user_path(@user)
      flash[:notice] = "Bookmark successfully removed."
    else
      flash[:error] = "Error deleting Bookmark. Please try again."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
