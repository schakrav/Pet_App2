require 'spec_helper'

describe Vaccine do
	before(:each) do
		@labrador_retriever = FactoryGirl.create(:animal, :name => "Labrador Retriever")
		@lakeland_terrier = FactoryGirl.create(:animal, :name => "Lakeland Terrier")
		@canine_distemper = FactoryGirl.create(:vaccine, :animal => @labrador_retriever)
		@rattlesnake_envenomation = FactoryGirl.create(:vaccine, :animal => @lakeland_terrier, :name => "Rattlesnake Envenomation")
		@giardia = FactoryGirl.create(:vaccine, :animal => @lakeland_terrier, :name => "Giardia")
	end

	describe "Test factories" do
		it "should have valid factory objects" do
			@labrador_retriever.should be_valid
			@lakeland_terrier.should be_valid
			@canine_distemper.should be_valid
			@rattlesnake_envenomation.should be_valid
			@giardia.should be_valid
		end	
	end 

	it "should have proper associations" do
 		should belong_to(:animal)
 		should have_many(:vaccinations)
 		should have_many(:visits).through (:vaccinations)
 	end

 	describe "Validations" do
 		it "should validate presence of" do
 			should validate_presence_of :name
 			should validate_presence_of :animal_id
 			should validate_presence_of :duration
 		end	

 		it "should validate_numericality_of" do
			should validate_numericality_of(:duration).only_integer
 		end	

 		it "should allow valid numbers for duration" do
 			should allow_value(58).for(:duration)
			should allow_value(180).for(:duration)
			should allow_value(720).for(:duration)
			should allow_value(1000).for(:duration)
		end
		
		it "should allow valid numbers for duration" do
			should_not allow_value(0).for(:duration)
			should_not allow_value(-7).for(:duration)
			should_not allow_value(28.1).for(:duration)
			should_not allow_value(-365.25).for(:duration)	
		end	
	end	

	describe "Scopes" do
		it "returns all the vaccine records in alphabetical order" do
			Vaccine.alphabetical.map{|vaccine| vaccine.name}.should == ["Canine Distemper", "Giardia", "Rattlesnake Envenomation"]
		end	

		it "should return all vaccinations for a given animal" do
			Vaccine.for_animal(@lakeland_terrier.id).alphabetical.map{|vaccine| vaccine.name}.should == ["Giardia", "Rattlesnake Envenomation"]
		end	
	end	
end
