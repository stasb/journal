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

# scenario 'Viewing account information' do
#   user = create(:user, name: 'test_name')
#   account = create(:account, name: user.name, id: user.id)
#   visit '/log_in'
#   page.has_content?('log in')
#   fill_in "email", :with => user.email
#   fill_in "password", :with => user.password
#   click_button('Save changes')
#   page.should have_content 'Logged in!'
#   click_link('Account Information')
#   page.should have_content 'test_name'
# end

end
