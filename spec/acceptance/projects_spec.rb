require 'acceptance/acceptance_helper'

feature 'Projects', %q{
Projects need to be creatable by users, and 
project information displayed on a show page
} do

  let(:account) { FactoryGirl.create(:account) }
  let(:user) { FactoryGirl.create(:user, account: account) }
  let!(:p1) { FactoryGirl.create(:project, account: account, name: "Project 1") }
  let!(:p2) { FactoryGirl.create(:project, account: account, name: "Project 2") }

  scenario 'creating a new project' do
    log_in user
    click_link "Create a project"
    page.should have_content "New Project"
    fill_in "project_name", with: "Test name project"
    click_button "Create"
    page.should have_content "Test name project"
  end

  scenario 'viewing project info' do
    log_in user
    click_link "Create a project"
    page.should have_content "New Project"
    fill_in "project_name", with: "Test name project"
    click_button "Create"
    page.should have_content "Test name project"
    click_link "Test name project"
    page.should have_content "Project Information"
    page.should have_content "Test name project"
  end

  scenario 'display list of created projects' do
    log_in user
    page.should have_content p1.name
    page.should have_content p2.name
  end

end
