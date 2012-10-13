require 'spec_helper'
describe Pet do
	describe "Create our factories" do
		before(:each) do
 			@german_shepherd = FactoryGirl.create(:animal)
 			@persian_cat = FactoryGirl.create(:animal, :name => "Persian Cat")
 			@alsatian = FactoryGirl.create(:animal)
 			@srinjoy = FactoryGirl.create(:owner)
 			@rishika = FactoryGirl.create(:owner, :firstname => "Rishika", :lastname => "Chy", :address => "Hannover93", :city => "WestBengal", :country => "UAE", :email => "rishikaachy@yahoo.com", :phone => "97444724223")
			@zaz = FactoryGirl.create(:pet, :name => "Zaz", :animal => @german_shepherd, :owner => @srinjoy)
			@toby = FactoryGirl.create(:pet, :name => "Toby", :animal => @alsatian, :owner => @srinjoy)
 		end	

 		it "should create the factories correctly" do
 			@german_shepherd.should be_valid
 			@persian_cat.should be_valid
 			@srinjoy.should be_valid
 			@rishika.should be_valid
 			@zaz.should be_valid
 		end	

 		it "should have valid attributes" do
 			@persian_cat.name.should == "Persian Cat"
 			@rishika.firstname.should == "Rishika"
 			@rishika.lastname.should == "Chy"
 			@rishika.address.should == "Hannover93"
 			@rishika.city.should == "WestBengal"
 			@rishika.country.should == "UAE"
 			@rishika.email.should == "rishikaachy@yahoo.com"
 			@rishika.phone.should == "97444724223"
 			@rishika.active.should == true
 			@zaz.name.should == "Zaz"
 			@zaz.female.should == true
			@zaz.date_of_birth.should == 5.years.ago
			@zaz.active.should == true
 		end	
 	end		

 	it "should have proper associations" do
		should belong_to(:owner)
		should belong_to(:animal)
	end	

	it "should have proper validations" do
		should validate_presence_of(:name)
	end

	it "should have correct associations" do
		@srinjoy.pets[0].name.should == "Zaz"
		@zaz.owner.firstname.should == "Srinjoy"
	end

	it "should allow an owner to have many pets" do
		@srinjoy.pets.count.shoud == 2
	end	
end

