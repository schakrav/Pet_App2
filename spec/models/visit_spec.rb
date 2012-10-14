require 'spec_helper'

describe Visit do
	it "should have proper associations" do
 		should belong_to(:pet)
 		should have_many(:vaccinations)
 		should have_many(:vaccines).through (:vaccinations)
 	end	
end
