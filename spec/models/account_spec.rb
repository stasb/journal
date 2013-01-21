require 'spec_helper'

describe Account do
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:user) }
  it { should have_many(:projects) }

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "creates a new instance given valid attributes" do
    @user.create_account
  end

  describe "user associations" do

    before(:each) do
      @account = @user.create_account(:name => @user.name, :id => @user.id)
    end

    it "should have a user attribute" do
      @account.should respond_to(:user)
    end

    it "should have the right associated user" do
      @account.user_id.should == @user.id
      @account.name.should == @user.name
    end

  end

end
