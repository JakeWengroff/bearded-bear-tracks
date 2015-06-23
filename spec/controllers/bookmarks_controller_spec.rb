require 'spec_helper'

RSpec.describe BookmarksController, type: :controller do

<<<<<<< HEAD
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      get :edit
      expect(response).to be_success
      expect(response).to have_http_status(200)
=======
  before { User.delete_all }
  before { Bookmark.delete_all }

  before(:each) do
   @user = FactoryGirl.create(:user)
   sign_in @user
   @topic = FactoryGirl.create(:topic)
   @user.topics << @topic
   @bookmark = FactoryGirl.create(:bookmark)
   @topic.bookmarks << @bookmark
  end

  describe "signed in user" do  
    it "signed in current user should not be nil" do
      @user = FactoryGirl.build(:user)  
      @user.save!
      sign_in @user 
      subject.current_user.should_not be_nil
    end
  end

  describe "show for bookmarks" do
    it "shows an bookmark" do
      get :show, id: @bookmark
      response.should be_success
    end
  end

  describe "editing an bookmark" do
    it "edits an bookmark" do
      get :edit, id: @bookmark
      response.should be_success
    end
  end
  
  describe "indexing bookmarks" do
    it "shows an index of bookmarks" do
      get :index 
      response.should be_success
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
    end
  end

  describe "deleting bookmarks" do
    it "destroys the bookmark" do 
      expect {
        delete :destroy, id: @bookmark
        }.to change(Bookmark, :count).by(-1)
    end

    it "redirects to the bookmarks list" do
      delete :destroy, id: @bookmark
      response.should redirect_to(bookmarks_url)
    end
  end
end
