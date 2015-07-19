class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])

    if @user.nil?
      @user = User.new(email: params[:sender], password: "temp0rary_passw0rd")
      @user.skip_confirmation!
      @user.save!
    end

    if @topic.nil?
      @topic = @user.topics.create(title: params[:subject])
    end

    @bookmark = @topic.bookmarks.create(user_id: @user.id, url: params["stripped-text"])

    head 200
  end
end

