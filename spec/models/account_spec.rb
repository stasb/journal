require 'spec_helper'

describe Account do
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:user) }
  it { should have_many(:projects) }

  before do
    @account = FactoryGirl.create(:account)
  end

  let! (:project_1) { FactoryGirl.create(:project, name: "Project 1", account: @account) }
  let! (:project_2) { FactoryGirl.create(:project, name: "Project 2", account: @account) }


  it "should destroy associated projects" do
    projects = @account.projects.dup
    @account.destroy
    projects.should_not be_empty
    projects.each do |project|
      Project.find_by_id(project.id).should be_nil
    end
  end

end

