class Pet < ActiveRecord::Base
  attr_accessible :active, :animal_id, :date_of_birth, :female, :name, :owner_id
  belongs_to :animal
  belongs_to :owner

  validates :name, :presence => true
end
