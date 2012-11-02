class Vaccination < ActiveRecord::Base
	attr_accessible :dosage, :vaccine_id, :visit_id

  	belongs_to :vaccine
  	belongs_to :visit

	validates :dosage, :vaccine_id, :visit_id, :presence => true 
	
	scope :for_vaccine, lambda{|vaccine_id| where('vaccine_id = ?', vaccine_id)} 
	scope :for_visit, lambda{|visit_id| where('visit_id = ?', visit_id)} 
	scope :chronological, joins(:visit).order('visit_date DESC') 
	
	scope :latest, lambda{|number| limit(number).joins(:visit).order('visit_date DESC')}
	
	scope :in_orders_with, lambda { |orders, type| where('itemable_type IS ?', type).joins(:order) & orders }
end
