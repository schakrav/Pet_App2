class Vaccination < ActiveRecord::Base
	attr_accessible :dosage, :vaccine_id, :visit_id

  belongs_to :vaccine
  belongs_to :visit

	
  validate :vaccine_offered_by_Joy_Veterinary_Services
  validate :vaccine_matches_animal_type 

	scope :for_vaccine, lambda{|vaccine_id| where('vaccine_id = ?', vaccine_id)} 
	scope :for_visit, lambda{|visit_id| where('visit_id = ?', visit_id)} 
	scope :chronological, joins(:visit).order('visit_date DESC') 
	scope :latest, lambda{|number| limit(number).joins(:visit).order('visit_date DESC')}

  private

	def vaccine_offered_by_Joy_Veterinary_Services
    vaccine_ids_list = Vaccine.all.map{|vaccine| vaccine.id}
    unless vaccine_ids_list.include?(self.vaccine_id)
      errors.add(:vaccine, "is not available at Joy Veterinary Services")
      return false
    end  
    
    return true
  end
  
  def vaccine_matches_animal_type
    animal = Visit.find(self.visit_id).pet.animal
    vaccine_ids_list = Vaccine.for_animal(animal.id).map{|vaccine| vaccine.id}
    unless vaccine_ids_list.include?(self.vaccine_id)
      errors.add(:vaccine, "is inappropriate for your animal")
      return false
    end  
    return true
  end      
      	
end
