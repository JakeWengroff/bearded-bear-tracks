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
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @topic
      response.should be_success
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      response.should be_success
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @topic
      response.should be_success
    end
  end

end