FactoryGirl.define do
	factory :owner do
		firstname "Srinjoy"
		lastname "Chakravarty"
		address "704-B The Pearl Qatar"
		city "Doha"
		country "QA"
		email "chaxz93@gmail.com"
		phone "97444724223"
		active true
	end	

	factory :animal do
		name "German Shepherd"
	end
	
	factory	:pet do
		name "Zaz"
		female true
		date_of_birth 5.years.ago
		active true
		association :owner
		association :animal
	end
end