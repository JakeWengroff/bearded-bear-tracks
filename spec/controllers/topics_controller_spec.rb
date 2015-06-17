# require 'rails_helper'
require 'spec_helper'

RSpec.describe TopicsController, type: :controller do

  before { User.delete_all }
  before { Topic.delete_all }

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @topic = FactoryGirl.create(:topic)
    @user.topics << @topic
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
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
    end
  end

end
