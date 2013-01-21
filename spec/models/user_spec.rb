require 'spec_helper'

describe User do
  it { should have_one(:account) }

  it { should validate_confirmation_of(:password) }

  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:email) }

  describe 'authentication' do

    before(:each) do
      @user = FactoryGirl.create(:user, :name => 'John', :email => 'john@gmail.com', :password => 'foo')
    end

    it "authenticates with valid credentials" do
      User.authenticate('john@gmail.com', 'foo').should == @user
    end

    it "doesn't authenticate with invalid email" do
      User.authenticate('incorrect@gmail.com', 'foo').should be_nil
    end

    it "doesn't authenticate with invalid password" do
      User.authenticate('john@gmail.com', 'incorrect').should be_nil
    end

    it "generates the password salt" do
      @user.password_salt.should_not be_empty
    end

    it "generates the password hash" do
      @user.password_hash.should_not be_empty
    end

  end

end
