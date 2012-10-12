require 'spec_helper'

describe Pet do
#	before(:each) do
 #		@cat = FactoryGirl.create(:animal)
 #		@dog = FactoryGirl.create(:animal, :name => "Dog")
 #		@srinjoy = FactoryGirl.create(:owner)
 #		@rishika = FactoryGirl.create(:owner, :firstname => "Rishika")
 #		@zaz = FactoryGirl.create(:pet, :name => "Zaz", :animal => @dog, :owner => @srinjoy)
 #	end		

 	it "should have proper associations" do
		should belong_to(:owner)
		should belong_to(:animal)
	end	

	it "should have proper validations" do
		should validate_presence_of(:name)
	end
end

