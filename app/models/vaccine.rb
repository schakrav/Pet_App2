class Vaccine < ActiveRecord::Base
	attr_accessible :animal_id, :duration, :name
  
	belongs_to :animal
	has_many :vaccinations
	has_many :visits, :through => :vaccinations
	
	validates :name, :animal_id, :duration, :presence => true 



end
