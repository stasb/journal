require 'acceptance/acceptance_helper'

feature 'Entries', %q{
Entries can be created on project pages,
and viewed as a list on the project view page
} do

  let!(:account) { FactoryGirl.create(:account) }
  let!(:user) { FactoryGirl.create(:user, account: account) }
  let!(:project) { FactoryGirl.create(:user, account: account) }

  let!(:e1) { FactoryGirl.create(:entry, project: project) }
  let!(:e2) { FactoryGirl.create(:entry, project: project) }

  scenario 'displaying current entries' do
    log_in user
  end

  scenario 'creating a new entry'

end
