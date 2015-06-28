require 'spec_helper'

describe LikesController do


  include Devise::TestHelpers

  before do 
    request.env["HTTP_REFERER"] = '/'
    @user = create(:user)
    @bookmark = create(:bookmark)
    sign_in @user
  end

  describe '#like' do
    it "adds a like to the bookmark" do
      expect {
        bookmark( :like, bookmark_id: @bookmark.id )
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