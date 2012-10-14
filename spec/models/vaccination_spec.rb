require 'spec_helper'

describe Vaccination do
it "should have proper associations" do
 		should belong_to(:visit)
 		should belong_to(:vaccine)
 	end	  
end
