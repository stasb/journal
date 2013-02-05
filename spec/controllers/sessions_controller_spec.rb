require 'spec_helper'

describe SessionsController do

  let!(:account) { FactoryGirl.create(:account) }
  let!(:user) { FactoryGirl.create(:user, account: account) }

  describe "POST #create" do

    context "with valid credentials" do
      before do
        User.stub(:authenticate).and_return(user)
        post :create
      end
      it { should set_session(:user_id) }
      it "redirects to the projects index page" do
        expect(response).to redirect_to(account_projects_path(account))
        flash[:notice].should eq("Logged in!")
      end
    end

    context "with invalid credentials" do
      before do
        User.stub(:authenticate).and_return(nil)
        post :create
      end
      it "renders the new template with an alert" do
        expect(response).to render_template(:new)
        flash[:alert].should eq("Invalid email or password")
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the session" do
      delete :destroy
      session[:user_id].should eq(nil)
    end
    it "redirects to the URL with a notice" do
      delete :destroy
      expect(response).to redirect_to(log_in_path)
    end
  end

end
