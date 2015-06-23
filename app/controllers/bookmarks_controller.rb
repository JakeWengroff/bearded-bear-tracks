class BookmarksController < ApplicationController
  before_filter :load_topics
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = @topic.present? ? @topic.bookmarks : Bookmark.all
  end

  def show
  end

  def show  
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.find(params[:topic_id])
<<<<<<< HEAD
    @bookmark = Bookmark.new
=======
    @bookmark = @topic.bookmarks.build
  end

  def edit
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
  end


  def create
    @topic = Topic.find(params[:topic_id])
<<<<<<< HEAD
    @bookmark = @topic.bookmarks.new(bookmark_params)
    @bookmark.user = User.find(current_user.id)
    if @bookmark.save
      flash[:notice] = "Bookmark was successfully saved."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :new
=======
    @bookmark = @topic.bookmarks.build(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @topic, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
    end
  end

  def update
    @topic = @bookmark.topic

    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @topic, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
<<<<<<< HEAD
    @bookmark = Bookmark.find(params[:id])
    @user = @bookmark.user
    if @bookmark.destroy
      redirect_to user_path(@user)
      flash[:notice] = "Bookmark successfully removed."
    else
      flash[:error] = "Error deleting Bookmark. Please try again."
      render :show
=======
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
    end
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def load_topics
      @topic = Topic.find(params[:topic_id]) if params[:topic_id].present?
    end

    def bookmark_params
      params.require(:bookmark).permit(:url, :user_id, :topic_id)
    end
end
