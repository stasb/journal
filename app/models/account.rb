class Account < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :projects, :dependent => :destroy
  validates_uniqueness_of :name
end
