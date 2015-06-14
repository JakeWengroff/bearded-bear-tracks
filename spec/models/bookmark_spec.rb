require 'spec_helper'

RSpec.describe Topic, type: :model do
  it "should have valid factory" do
    FactoryGirl.build(:bookmark).should be_valid
  end

  it "should require a topic" do
      FactoryGirl.build(:bookmark, :topic_id => "").should_not be_valid
  end

  it "should require a url" do
      FactoryGirl.build(:bookmark, :url => "").should_not be_valid
  end
end
