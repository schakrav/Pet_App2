class Owner < ActiveRecord::Base
  attr_accessible :active, :address, :city, :country, :email, :firstname, :lastname, :phone

	validates :firstname, :presence => true
	validates :lastname, :presence => true
	validates :email, :presence => true
	validates :phone, :presence => true
	validates :city, :country, :presence => true

	COUNTRY_LIST = [['Qatar', 'QA'], ['Saudia Arabia', 'KSA'], ['United Arab Emirates', 'UAE']]
end
