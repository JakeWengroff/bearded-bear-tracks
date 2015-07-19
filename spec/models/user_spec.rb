require 'spec_helper'

describe User do

  describe "#liked(bookmark)" do

    before { Topic.delete_all }

    before do 
      @user = create(:user)
      @bookmark = create(:bookmark)
    end

    it "returns `nil` if the user has not liked the post" do
      expect( @user.liked(@bookmark) ).to eq(nil)
    end

    it "returns a like if it exists" do
      like = @user.likes.where(bookmark: @bookmark).create
      expect( @user.liked(@bookmark) ).to eq(like)
    end
  end

end