require 'spec_helper'

RSpec.describe Bookmark, type: :model do
  it { should validate_presence_of :topic }
  it { should validate_presence_of :url }
end

