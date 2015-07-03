require 'spec_helper'

RSpec.describe BookmarksController, type: :controller do

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
