require 'spec_helper'

describe SessionsController do

  let(:user) { FactoryGirl.create(:user) }

  describe "POST #create" do
    context "with valid credentials" do
      before do
        User.stub(:authenticate).and_return(user)
        post :create
      end
      it "authenticates the user and stores the id in a session" do
        session[:user_id].should eq(user.id)
      end
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
      it "shows a flash message" do
        flash[:alert].should eq("Invalid email or password")
      end
      it "renders the new template" do
        expect(response).to render_template(:new)
      end
    end

  end

end
