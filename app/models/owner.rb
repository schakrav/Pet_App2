class Owner < ActiveRecord::Base
  
  attr_accessible :active, :address, :city, :country, :email, :firstname, :lastname, :phone

  before_save :format_phone

  validates :firstname, :lastname, :email, :phone, :city, :country, :presence => true
  
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid form for an email-address"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]\d{4}[-.]\d{4})$/, :message => "should be 11 digits (country code needed) and delimited with appropiated symbolss"
  
  validates_inclusion_of :country, :in => %[QA KSA UAE], :message => "is not an option", :allow_nil => true, :allow_blank => true
	
  COUNTRY_LIST = [['Qatar', 'QA'], ['Saudi Arabia', 'KSA'], ['United Arab Emirates', 'UAE']]
 
  scope :alphabetical, order('lastname, firstname')
  scope :active, where('active = ?', true)

  def proper_name
  	firstname + " " + lastname
  end	

  def name 
	lastname + ", " + firstname  	
  end

  private
  
    def format_phone
    phone = self.phone.to_s
    phone.gsub!(/[^0-9]/,"")
    self.phone = phone
    end


end
