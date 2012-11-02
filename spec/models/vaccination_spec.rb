require 'spec_helper'

describe Vaccination do
	before(:each) do
		@srinjoy = FactoryGirl.create(:owner)
		@rishika = FactoryGirl.create(:owner, :firstname => "Rishika", :lastname => "Chy", :address => "Tampa Bay", :city => "Nordsjaelland", :country => "DEN", :email => "rishikaachy@yahoo.com", :phone => "97412345678")
	
		@golden_retriever = FactoryGirl.create(:animal, :name => "Golden Retriever")
		
		@zaz = FactoryGirl.create(:pet, :owner => @rishika)
		@snowy = FactoryGirl.create(:pet, :owner => @srinjoy, :name => "Snowy")
		@rox = FactoryGirl.create(:pet, :animal => @golden_retriever, :owner => @rishika, :name => "Rox", :female => false, :date_of_birth => 3.years.ago.to_date)
	
		@hepatitis = FactoryGirl.create(:vaccine, :name => "Hepatitis")
		@measles = FactoryGirl.create(:vaccine, :name => "Measles", :duration => 200)
		@parainfluenza = FactoryGirl.create(:vaccine, :name => "Parainfluenza", :duration => 300, :animal => @golden_retriever)
		@placebo = FactoryGirl.create(:vaccine, :name => "Placebo", :duration => 1)

		@visit4 = FactoryGirl.create(:visit, :pet => @snowy)
		@visit5 = FactoryGirl.create(:visit, :pet => @snowy, :visit_date => 7.weeks.ago.to_date)
		@visit6 = FactoryGirl.create(:visit, :pet => @rox, :weight => 35, :visit_date => 4.months.ago.to_date)
		@visit7 = FactoryGirl.create(:visit, :pet => @rox, :weight => 22, :visit_date => 1.day.ago.to_date)
	
		@snowy_hepatitis_shot = FactoryGirl.create(:vaccination, :vaccine => @hepatitis, :visit => @visit4)
		@zaz_hepatitis_shot = FactoryGirl.create(:vaccination, :vaccine => @hepatitis, :visit => @visit5)
		@snowy_measles_shot = FactoryGirl.create(:vaccination, :vaccine => @measles, :visit => @visit4)
		@rox_parainfluenza_shot = FactoryGirl.create(:vaccination, :vaccine => @parainfluenza, :visit => @visit6)
	end	

	describe "Test factories" do
		it "should have valid factory objects" do
			@srinjoy.should be_valid
			@rishika.should be_valid
			@zaz.should be_valid
			@snowy.should be_valid
			@rox.should be_valid
			@golden_retriever.should be_valid
			@hepatitis.should be_valid
			@measles.should be_valid
			@parainfluenza.should be_valid
			@placebo.should be_valid
			@visit4.should be_valid
			@visit5.should be_valid
			@visit6.should be_valid
			@visit7.should be_valid
			@snowy_hepatitis_shot.should be_valid
			@zaz_hepatitis_shot.should be_valid
			@snowy_measles_shot.should be_valid
			@rox_parainfluenza_shot.should be_valid
		end	

		it "should have proper associations" do
 			should belong_to(:visit)
 			should belong_to(:vaccine)
 		end
 		it "should have valid attributes" do
 			@srinjoy.firstname.should == "Srinjoy"
 			@rishika.lastname.should == "Chy"
 			@golden_retriever.name.should == "Golden Retriever"
 			@zaz.name.should == "Zaz"
 			@snowy.name.should == "Snowy"
 			@rox.name.should == "Rox"
 			@hepatitis.name.should == "Hepatitis"
 			@measles.name.should == "Measles"
 			@parainfluenza.name.should == "Parainfluenza"
 			@placebo.name.should == "Placebo"
 			@visit4.pet.name.should == "Snowy"
 			@visit5.weight == 69
 			@visit6.weight == 35
 			@visit7.weight == 22
 			@snowy_hepatitis_shot.vaccine.name.should == "Hepatitis"
 			@zaz_hepatitis_shot.vaccine.name.should == "Hepatitis"
 			@snowy_measles_shot.vaccine.name.should == "Measles"
 			@rox_parainfluenza_shot.vaccine.name.should == "Parainfluenza"
 		end		
 	end	

 	describe "Validations" do
 		it "should validate presence of" do
 			should validate_presence_of :dosage
 			should validate_presence_of :vaccine_id
 			should validate_presence_of :visit_id
 		end	
 	end

 	describe "Scopes" do
 		it "should put all the vaccinations in chronological order" do
			sample_dates = Array.new
			sample_dates << 3.days.ago.to_date
			sample_dates << 3.days.ago.to_date
			sample_dates << 7.weeks.ago.to_date
			sample_dates << 4.months.ago.to_date
			ordered_dates = Vaccination.chronological.map {|vaccination| vaccination.visit.visit_date}
			ordered_dates.should == sample_dates
		end	

		it "should allow us to return the vaccinations for a given vaccine" do
			Vaccination.for_vaccine(@hepatitis.id).size.should == 2
			Vaccination.for_vaccine(@measles.id).size.should == 1
			Vaccination.for_vaccine(@parainfluenza.id).size.should == 1
			Vaccination.for_vaccine(@placebo.id).size.should == 0
		end

		it "should allow us to return the vaccinations for a given visit" do
			Vaccination.for_visit(@visit4.id).size.should == 2
			Vaccination.for_visit(@visit5.id).size.should == 1
			Vaccination.for_visit(@visit6.id).size.should == 1
			Vaccination.for_visit(@visit7.id).size.should == 0
		end
 	end	
end
