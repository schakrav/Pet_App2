class Visit < ActiveRecord::Base
  attr_accessible :notes, :pet_id, :visit_date, :weight
  
  belongs_to :pet
  has_many :vaccinations
  has_many :vaccines, :through => :vaccinations

  validates :pet_id, :weight, :visit_date, :presence => true 
  validates :weight, :numericality => {:greater_than => 0, :only_integer => true}

  scope :chronological, order('visit_date DESC')
  scope :for_pet, lambda{|pet_id| where('pet_id = ?', pet_id)}
  scope :latest, lambda{|number| limit(number).order('visit_date DESC')}

end
