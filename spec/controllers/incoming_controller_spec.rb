require 'spec_helper'

describe IncomingController do
  before :each do
    @user = FactoryGirl.create(:user, email: 'hello1@bearded-bear-tracks.com')
  end

  describe "POST 'create'" do
    context 'email valid parameters to create a bookmark for the user' do
      it "returns http success" do
        post 'create', sender: 'hello1@bearded-bear-tracks.com', subject: 'New Bookmark', :'body-plain' => 'http://www.url.com'
        response.should be_success
      end
    end
  end
end