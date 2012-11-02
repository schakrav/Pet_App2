class Vaccination < ActiveRecord::Base
	attr_accessible :dosage, :vaccine_id, :visit_id

  	belongs_to :vaccine
  	belongs_to :visit

	validates :dosage, :vaccine_id, :visit_id, :presence => true 
	
	scope :for_vaccine, lambda{|vaccine_id| where('vaccine_id = ?', vaccine_id)} 
	scope :for_visit, lambda{|visit_id| where('visit_id = ?', visit_id)} 
	scope :latest, lambda{|number| where('number = ?', number)}
end
