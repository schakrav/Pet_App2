require 'spec_helper'

describe Visit do
	before(:each) do
		@owner = FactoryGirl.create(:owner)
		@zaz = FactoryGirl.create(:pet, :owner => @owner)
		@toby = FactoryGirl.create(:pet, :name => "Toby", :owner => @owner)
		@visit1 = FactoryGirl.create(:visit, :pet => @zaz)
		@visit2 = FactoryGirl.create(:visit, :pet => @zaz, :visit_date => 6.days.ago)
		@visit3 = FactoryGirl.create(:visit, :pet => @toby, :visit_date => 4.years.ago)
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
 		@visit1.should be_valid
 		@visit2.should be_valid
 		@visit3.should be_valid
 	end	

 	it "should validate that weight is greater than 0 (version 1)" do
 		@visit1.weight = 0
 		@visit1.should_not be_valid
 	end	

 	it "should validate that weight is greater than 0 (version 2)" do
 		@visit1.weight = 37
 		@visit1.should be_valid
 	end

	it "should accept valid weights" do
		should allow_value(1).for(:weight)
		should allow_value(10).for(:weight)
		should allow_value(50).for(:weight)
		should allow_value(100).for(:weight)
	end

	it "should not accept invalid weights" do
		should_not allow_value(0).for(:weight)
		should_not allow_value(-23).for(:weight)
		should_not allow_value(34.39).for(:weight)
		should_not allow_value(-134.41).for(:weight)
	end

	it "should put all the visits in chronological order" do
		sample_dates = Array.new
		sample_dates << 3.days.ago.to_date
		sample_dates << 6.days.ago.to_date
		sample_dates << 4.years.ago.to_date
		ordered_dates = Visit.chronological.map {|e| e.visit_date}
		ordered_dates.should == sample_dates
	end	

	it "should allow us to return the visits for a given pet" do
		Visit.for_pet(@toby.id).size.should == 1
		Visit.for_pet(@zaz.id).size.should == 2
	end

	it "should allow us to return the last 'x' visits" do
		Visit.for_pet(@zaz.id).latest(3).size.should == 2 
		Visit.for_pet(@zaz.id).latest(2).size.should == 2 
		Visit.for_pet(@zaz.id).latest(1).size.should == 1 
	end	
end