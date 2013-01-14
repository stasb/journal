require 'spec_helper'

describe User do
  it { should belong_to(:account) }

  it { should validate_confirmation_of(:password) }

  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:email) }

  describe ".authenticate" do
    let (:user) { FactoryGirl.create(:user, name: "John", email: "john@gmail.com", password: "12345") }

    subject { User.authenticate(user.email, password) }

    context "correct password" do
      let(:password) { "12345" }
      it("returns a user") { should eq(user) }
    end

    context "incorrect password" do
      let(:password) { "incorrect-password" }
      it("returns nil") { should be_nil }
    end

    it "generates the password salt" do
      user.password_salt.should_not be_empty
    end

    it "generates the password hash" do
      user.password_hash.should_not be_empty
    end

  end
end
