require 'acceptance/acceptance_helper'

feature 'User accounts' do

  scenario 'Creating a new user account' do
    visit root_url
    page.has_content?('Sign Up')
    fill_in('Name', :with => 'John')
    fill_in('Email', :with => 'john@gmail.com')
    fill_in('user_password', :with => '12345')
    fill_in('user_password_confirmation', :with => '12345')
    click_button('Create User')
    page.should have_content 'Signed up!'
    Account.last.name.should eql(User.last.name)
    Account.last.user_id.should eql(User.last.id)
  end

end
