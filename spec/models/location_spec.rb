require 'spec_helper'

describe Location do
  it { should have_and_belong_to_many(:students) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
