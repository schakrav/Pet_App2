class Pet < ActiveRecord::Base
  attr_accessible :active, :animal_id, :date_of_birth, :female, :name, :owner_id
  belongs_to :animal
  belongs_to :owner
  has_many :visits

  validates :name, :presence => true

 	scope :alphabetical, order('name')
  	scope :active, where('active = ?', true)
	scope :female, where('female = ?', true)
	scope :male, where('female = ?', false)

scope :for_owner, lambda{|owner_id| where('owner_id = ?', owner_id)} 
scope :by_animal, lambda{|animal_id| where('animal_id = ?', animal_id)} 
scope :born_before, lambda{|date_of_birth| where('date_of_birth < ?', date_of_birth)} 
end
