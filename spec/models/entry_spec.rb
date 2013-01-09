require 'spec_helper'

describe Entry do
  it { should belong_to(:project) }
end
