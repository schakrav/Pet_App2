class Animal < ActiveRecord::Base
  attr_accessible :name
  has_many :pets

  validates :name, :presence => true
end
