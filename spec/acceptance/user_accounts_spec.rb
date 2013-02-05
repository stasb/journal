require 'acceptance/acceptance_helper'

feature 'User pages', %q{
Testing account creation and log in/out behavior
} do

  let!(:account) { FactoryGirl.create(:account) }
  let!(:user) { FactoryGirl.create(:user, account: account) }

  scenario 'Creating a new user' do
    visit "/sign_up"
    fill_in "Name", :with => "John"
    fill_in "Email", :with => "john@gmail.com"
    fill_in "user_password", :with => "123"
    fill_in "user_password_confirmation", :with => "123"
    click_button "Submit"
    page.should have_content "Signed up!"
  end

  scenario 'Signing in with valid credentials' do
    visit "/log_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Submit"
    page.should have_content "Logged in!"
  end

  scenario 'Signing in with invalid credentials' do
    visit "/log_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "incorrect_password"
    click_button "Submit"
    page.should have_content "Invalid email or password"
  end

  scenario 'Signing out' do
    visit "/log_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Submit"
    page.should have_content "Logged in!"
    click_link "Log out"
    page.should have_content "Logged out!"
  end

  scenario 'Viewing account information' do
    visit "/log_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Submit"
    page.should have_content "Logged in!"
    click_link "Account Information"
    page.should have_content "Account Name"
    page.should have_content account.name
  end

end
