class Vaccine < ActiveRecord::Base
	attr_accessible :animal_id, :duration, :name
  
	belongs_to :animal
	has_many :vaccinations
	has_many :visits, :through => :vaccinations
	
	validates :name, :animal_id, :duration, :presence => true 
	validates :duration, :numericality => {:greater_than => 0, :only_integer => true, :allow_blank => true, :allow_nil => true}

 	scope :alphabetical, order('name ASC')


end
