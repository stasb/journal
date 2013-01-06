class Account < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  validates_uniqueness_of :name
end
