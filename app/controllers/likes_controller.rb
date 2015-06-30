class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark_id: @bookmark.id)
    
    authorize like
    if like.save
    flash[:notice] = "Bookmark was liked."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error liking the bookmark. Please try again."
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.liked(@bookmark)
    
    authorize like
    if like.destroy
      flash[:notice] = "Bookmark was successfully unliked."
      redirect_to topics_path
    else
      flash[:error] = "There was an error unliking the bookmark."
      render :show
    end
  end

end
