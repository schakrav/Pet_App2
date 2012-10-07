
require 'spec_helper'

FactoryGirl.define do
	factory :owner do
		firstname "Srinjoy"
		lastname "Chakravarty"
		address "704-B The Pearl Qatar"
		city "Doha"
		country "QA"
		email "chaxz@cmu.edu"
		phone "97444724223"
		active true
	end	
end