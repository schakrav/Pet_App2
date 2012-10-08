class Animal < ActiveRecord::Base
  attr_accessible :name
  has_many :pets
end
