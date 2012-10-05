class Owner < ActiveRecord::Base
  attr_accessible :active, :address, :city, :country, :email, :firstname, :lastname, :phone
end
