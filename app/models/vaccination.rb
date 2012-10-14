class Vaccination < ActiveRecord::Base
  attr_accessible :dosage, :vaccine_id, :visit_id

  belongs_to :vaccine
  belongs_to :visit
end
