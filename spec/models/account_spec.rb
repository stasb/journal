require 'spec_helper'

describe Account do
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:user) }
  it { should have_many(:projects) }

end
