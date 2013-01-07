require 'spec_helper'

FactoryGirl.define do
  factory :user do
    name "Stas"
    email "stas@gmail.com"
    password "abc123"
  end
end

describe User do
  context 'association/validation' do
    it { should belong_to(:account) }

    it { should validate_confirmation_of(:password) }

    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:email) }
  end

  context 'bcrypt methods' do
    describe 'authentication' do
      it 'return the user if credentials match' do
        user_init = FactoryGirl.create(:user, name: "John", email: "john@gmail.com", password: "12345")
        result = User.authentication(user_init.email, user_init.password)
        result.should eql(user_init)
      end
      it 'return nil if the credentials do not match' do
        user_init = FactoryGirl.create(:user, name: "John", email: "john@gmail.com", password: "12345")
        result = User.authentication(user_init.email, "non-matching-password")
        result.should be(nil)
      end
    end

    describe 'encrypt password' do
    end
  end
end
