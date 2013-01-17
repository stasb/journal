require 'acceptance/acceptance_helper'

feature 'User accounts' do

  scenario 'Creating a new account' do
    visit root_url
    page.has_content?('Sign Up')
    fill_in('Name', :with => 'John')
    fill_in('Email', :with => 'john@gmail.com')
    fill_in('user_password', :with => '12345')
    fill_in('user_password_confirmation', :with => '12345')
    click_button('Create User')
    page.should have_content 'Signed up!'
  end

  scenario 'Signing into an account with valid credentials' do
    user = FactoryGirl.create(:user)
    visit '/log_in'
    page.has_content?('Log in')
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button('Save changes')
    page.should have_content 'Logged in!'
  end

  scenario 'Signing into an account with invalid credentials' do
    user = FactoryGirl.create(:user)
    visit '/log_in'
    page.has_content?('Log in')
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "wrong password"
    click_button('Save changes')
    page.should have_content 'Invalid email or password'
  end

  scenario 'Signing out of an account'

end
