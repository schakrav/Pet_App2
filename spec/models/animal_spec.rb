require 'spec_helper'

describe Animal do
	it "should have proper associations" do
		should have_many(:pets)
	end	

	it "should have proper validations" do
		should validate_presence_of(:name)
	end
end