require 'spec_helper'

describe UsersController do

  render_views

  describe "GET #new" do
    subject { response }

    before do
      get :new
    end

    it { should be_success }
    it { should render_template(:new) }
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change{User.count}.by(1)
      end
      it "redirects to the URL with a flash notice" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(root_url)
        flash[:notice].should eql("Signed up!")
      end
    end

    context "with invalid attributes" do
      it "does not save the user in the database" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
        }.to_not change{User.count}
      end
      it "redirects to the new form/page without a flash notice" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template(:new)
        flash[:notice].should be_nil
      end
    end
  end
end
