require 'spec_helper'

describe Account do
  before(:each) { Account.create!(:name => 'Stas') }
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:user) }
end
