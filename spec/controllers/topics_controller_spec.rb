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
<<<<<<< HEAD
      expect(response).to be_success
      expect(response).to have_http_status(200)
=======
      response.should be_success
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
    end
  end

  describe "GET #show" do
<<<<<<< HEAD
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
=======
    it "returns http success" do
      get :show, id: @topic
      response.should be_success
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
<<<<<<< HEAD
      expect(response).to be_success
      expect(response).to have_http_status(200)
=======
      response.should be_success
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
    end
  end

  describe "GET #edit" do
<<<<<<< HEAD
    it "responds successfully with an HTTP 200 status code" do
      get :edit
      expect(response).to be_success
      expect(response).to have_http_status(200)
=======
    it "returns http success" do
      get :edit, id: @topic
      response.should be_success
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
    end
  end

end
