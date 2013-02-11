class Entry < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :project

  validates_presence_of :body, :title
end
