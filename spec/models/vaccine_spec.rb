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
 	end	
end
