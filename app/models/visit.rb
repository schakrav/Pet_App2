class Visit < ActiveRecord::Base
  attr_accessible :notes, :pet_id, :visit_date, :weight
  belongs_to :pet
  has_many :vaccinations
  has_many :vaccines, :through => :vaccinations
end
