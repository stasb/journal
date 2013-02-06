class Project < ActiveRecord::Base
  attr_accessible :name

  belongs_to :account
  has_many :entries
end
