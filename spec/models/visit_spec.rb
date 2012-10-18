require 'spec_helper'

describe Visit do
	before(:each) do
		@owner = FactoryGirl.create(:owner)
		@pet = FactoryGirl.create(:pet, :owner => @owner)
		@visit = FactoryGirl.create(:visit, :pet => @pet)
	end

	it "should have proper associations" do
 		should belong_to(:pet)
 		should have_many(:vaccinations)
 		should have_many(:vaccines).through(:vaccinations)
 	end	

 	it "should validate the presence of pet_id" do
 		should validate_presence_of :pet_id
 	end

 	it "should validate the presence of weight" do
 		should validate_presence_of :weight
 	end

 	it "should validate the presence of visit_date" do
 		should validate_presence_of :visit_date
 	end

 	it "should validate the numericality of weight" do
 		should validate_numericality_of :weight
 	end	

	it "should create valid visit factory" do
 		@visit.should be_valid
 	end	

 	it "should validate that weight is greater than 0" do
 		@visit.weight = 0
 		@visit.should_not be_valid
 	end	
end
