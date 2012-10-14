require 'spec_helper'

describe Vaccine do
 it "should have proper associations" do
 		should belong_to(:animal)
 		should have_many(:vaccinations)
 		should have_many(:visits).through (:vaccinations)
 	end	
end
