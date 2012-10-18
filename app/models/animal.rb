class Animal < ActiveRecord::Base
  attr_accessible :name
  has_many :pets
  has_many :vaccines

  validates :name, :presence => true
end
 