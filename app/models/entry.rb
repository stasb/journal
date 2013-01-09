class Entry < ActiveRecord::Base
  attr_accessible :body, :title, :entered_on, :project_id

  belongs_to :project
end
