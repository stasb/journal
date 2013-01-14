require 'spec_helper'

describe UsersController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  describe "POST #new" do
    it "creates a blank user for editing" do
      User.stub(:new) { [mock_user] }
      get :new
      assigns(:user).should eq([mock_user])
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database"
      it "redirects to the URL with a notice"
    end

    context "with invalid attributes" do
      it "does not save the user in the database"
      it "redirects to the new form/page"
    end
  end
end
