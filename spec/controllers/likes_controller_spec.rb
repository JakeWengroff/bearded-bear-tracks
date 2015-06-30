require 'spec_helper'

describe LikesController, type: :controller do

  include Devise::TestHelpers

  before { User.delete_all }
  before { Bookmark.delete_all }
  before { Like.delete_all }

  before do 
    request.env["HTTP_REFERER"] = '/'
    @user = create(:user)
    sign_in @user
    @bookmark = create(:bookmark)
  end

  describe '#like' do
    it "adds a like to the bookmark" do
      expect {
        bookmark( :like, bookmark_id: @bookmark.id, user_id: @user.id)
      }.to create{ @bookmark.likes }
    end
  end

  describe '#unlike' do
    it "removes a like from the bookmark" do
      expect {
        bookmark( :like, bookmark_id: @bookmark.id )
      }.to destroy{ @bookmark.likes }
    end
  end

end