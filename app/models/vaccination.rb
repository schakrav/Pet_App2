class Vaccination < ActiveRecord::Base
  attr_accessible :dosage, :vaccine_id, :visit_id
end
