require 'spec_helper'

describe User do
  it { should belong_to(:account) }

  it { should validate_confirmation_of(:password) }

  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:email) }

  context 'authentication' do

    it "authenticates with valid credentials" do
      user = User.create!(:name => 'John', :email => 'john@gmail.com', :password => 'foo')
      User.authenticate('john@gmail.com', 'foo').should == user
    end

    it "doesn't authenticate with invalid credentials" do
      user = User.create!(:name => 'John', :email => 'john@gmail.com', :password => 'foo')
      User.authenticate('john@gmail.com', 'incorrect').should be_nil
    end


    it "generates the password salt"

    it "generates the password hash"

  end
  # FactoryGirl.define do
  #   factory :user do
  #     name "Stas"
  #     email "stas@gmail.com"
  #     password "abc123"
  #   end
  # end

  # test_user = FactoryGirl.create(:user, name: "John", email: "Jonno" )

  # it "authentication succeeds with correct credentials" do
  #   User.authentication(test_user.email, test_user.password).should_not == nil
  # end

  # it "authentication fails with incorrect credentials"

  # it "generates a password salt" do
  #   test_user.password_salt.should_not be_empty
  # end

  # it "generates a password hash" do
  #   test_user.password_hash.should_not be_empty
  # end

end
