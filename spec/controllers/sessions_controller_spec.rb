require 'spec_helper'

describe SessionsController do

  let(:user) { FactoryGirl.create(:user) }

  describe "POST #create" do

    context "with valid credentials" do
      before do
        User.stub(:authenticate).and_return(user)
        post :create
      end
      it { should set_session(:user_id) }
      it "redirects to the root URL with a notice" do
        expect(response).to redirect_to(root_url)
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
      expect(response).to redirect_to(root_url)
      flash[:notice].should eq("Logged out!")
    end
  end

end
