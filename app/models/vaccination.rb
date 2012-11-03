class Vaccination < ActiveRecord::Base
	attr_accessible :dosage, :vaccine_id, :visit_id

  	belongs_to :vaccine
  	belongs_to :visit

	validates :dosage, :vaccine_id, :visit_id, :presence => true 

	scope :for_vaccine, lambda{|vaccine_id| where('vaccine_id = ?', vaccine_id)} 
	scope :for_visit, lambda{|visit_id| where('visit_id = ?', visit_id)} 
	scope :chronological, joins(:visit).order('visit_date DESC') 
	
	scope :latest, lambda{|number| limit(number).joins(:visit).order('visit_date DESC')}

	def vaccine_offered_by_QATS(vaccine_name)
    	@vac_name = vaccine_name
    	@vaccinations = Vaccination.all
    	
    	@vaccines = Vaccine.all[]
    
    	Vaccine.where(:name => 'hepatitis').exists?
  	end

  	def validate(record)
    unless record.name.starts_with? 'X'
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end



  	def vaccine_matches_animal_type
  	
  	end		

  	

end
