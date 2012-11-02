require 'spec_helper'
describe Pet do

	it "should have proper associations" do
		should belong_to(:owner)
		should belong_to(:animal)
		should have_many(:visits)
	end

	it "should have a name" do
		should validate_presence_of(:name)
	end	



	describe "Create our factories" do
		before(:each) do
 			@german_shepherd = FactoryGirl.create(:animal)
 			@persian_cat = FactoryGirl.create(:animal, :name => "Persian Cat")
 			@alsatian = FactoryGirl.create(:animal)
 			@srinjoy = FactoryGirl.create(:owner)
 			@rishika = FactoryGirl.create(:owner, :firstname => "Rishika", :lastname => "Chy", :address => "Hannover93", :city => "WestBengal", :country => "UAE", :email => "rishikaachy@yahoo.com", :phone => "97412345678")
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
 			@rishika.phone.should == "97412345678"
 			@rishika.active.should == true
 			@zaz.name.should == "Zaz"
 			@zaz.female.should == true
			@zaz.active.should == true
			@srinjoy.firstname.should == "Srinjoy"
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
		@srinjoy.pets[1].name.should == "Toby"
		@zaz.owner.firstname.should == "Srinjoy"
	end

	it "should allow an owner to have many pets" do
		@srinjoy.pets.count.should == 2
	end	
end
end

