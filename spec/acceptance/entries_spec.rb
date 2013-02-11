require 'acceptance/acceptance_helper'

feature 'Entries', %q{
Entries can be created on project pages,
and viewed as a list on the project view page
} do

  let!(:account) { FactoryGirl.create(:account) }
  let!(:user) { FactoryGirl.create(:user, account: account) }
  let!(:project) { FactoryGirl.create(:project, account: account) }

  let!(:e1) { FactoryGirl.create(:entry, project: project) }
  let!(:e2) { FactoryGirl.create(:entry, project: project) }

  scenario 'displaying current entries' do
    log_in user
    click_link project.name
    page.should have_content e1.title
    page.should have_content e2.title
  end

  scenario 'creating a new entry' do
    log_in user
    click_link project.name
    page.should have_content "New entry"
    click_link "New entry"
    fill_in "entry_title", with: "This is a title"
    fill_in "entry_body", with: "some body text"
    click_button "Submit"
    page.should have_content "This is a title"
    page.should have_content project.name
  end

  scenario 'deleting an existing entry' do
    log_in user
    click_link project.name
    click_link e1.title
    click_link 'delete entry'
    page.should have_content 'Entry deleted.'
  end

  scenario 'show a specific entry' do
    log_in user
    click_link project.name
    click_link e1.title
    page.should have_content e1.title
    page.should have_content e1.body
  end

end
