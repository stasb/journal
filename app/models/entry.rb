class Entry < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :project, :dependent => :destroy
end
