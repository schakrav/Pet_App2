class Vaccine < ActiveRecord::Base
	attr_accessible :animal_id, :duration, :name
  
	before_save :check_vaccine_durability

	belongs_to :animal
	has_many :vaccinations
	has_many :visits, :through => :vaccinations
	
	validates :name, :animal_id, :presence => true 
	validates :duration, :numericality => {:greater_than => 0, :only_integer => true, :allow_blank => true, :allow_nil => true}

 	scope :alphabetical, order('name ASC')
 	scope :for_animal, lambda{|animal_id| where('animal_id = ?', animal_id)} 

 	private

 	def check_vaccine_durability
 		duration = self.duration
 		self.duration = 10000 if duration.nil? || duration.blank?
 	end	



end
