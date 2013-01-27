require 'spec_helper'

describe AccountsController do

  render_views

  describe "GET #show" do

    before do
      @user = FactoryGirl.create(:user)
      @session = @user.id
      @account = FactoryGirl.create(:account, user_id: @user.id)
    end

    it "assigns the current user"

    it "assigns the correct account"

  end

end
