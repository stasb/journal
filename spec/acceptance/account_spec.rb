require 'acceptance/acceptance_helper'

feature 'Accounts', %q{
Account need to be created automatically
when a new user is created.
} do

  scenario 'Creating a new user account' do
    visit "/sign_up"
    fill_in "Name", :with => "John"
    fill_in "Email", :with => "john@gmail.com"
    fill_in "user_password", :with => "123"
    fill_in "user_password_confirmation", :with => "123"
    click_button "Submit"
    page.should have_content "Signed up!"
    Account.last.name.should eql(User.last.name)
    Account.last.user_id.should eql(User.last.id)
  end

end
