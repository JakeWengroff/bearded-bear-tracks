require 'spec_helper'

RSpec.describe Topic, type: :model do
  it { should validate_presence_of :title }
end