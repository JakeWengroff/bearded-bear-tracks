class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

<<<<<<< HEAD
  def show  
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
=======
  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks.all
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic was successfully saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :new
    end
  end

  def edit
     @topic = Topic.find(params[:id])
  end

   def update
     @topic = Topic.find(params[:id])
     if @topic.update_attributes(topic_params)
       flash[:notice] = "Topic was successfully renamed."
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end


end
