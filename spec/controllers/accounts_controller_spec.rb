require 'spec_helper'

describe AccountsController do

  let!(:account) { FactoryGirl.create(:account) }
  let!(:user) { FactoryGirl.create(:user, account: account) }

  describe "GET #show" do

    before(:each) do
      session[:user_id] = user.id
    end

    it "assigns the current user" do
      get :show
      assigns(:current_user).should eql(user)
    end

    it "assigns the correct account" do
      get :show
      assigns(:account).should eql(account)
    end

  end

end
