require 'spec_helper'

RSpec.describe Topic, type: :model do
  it "should have valid factory" do
    FactoryGirl.build(:topic).should be_valid
  end

  it "should require a username" do
      FactoryGirl.build(:topic, :title => "").should_not be_valid
  end
end