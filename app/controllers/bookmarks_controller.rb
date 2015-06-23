class BookmarksController < ApplicationController
  before_filter :load_topics
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = @topic.present? ? @topic.bookmarks : Bookmark.all
    authorize @bookmarks
  end

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build
    authorize @bookmark
  end

  def edit
    authorize @bookmark
  end


  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    authorize @bookmark

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @topic, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @topic = @bookmark.topic
    authorize @bookmark

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
    authorize @bookmark
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
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
