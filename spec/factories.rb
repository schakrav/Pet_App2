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
		date_of_birth 5.years.ago.to_date
		active true
		association :owner
		association :animal
	end

	factory :visit do
		weight 69
		visit_date 3.days.ago.to_date
		notes "Regular Check-up"
		association :pet
	end	

	factory :vaccine do
		name "Canine Distemper"
		duration 366
		association :animal
	end	

	factory :vaccination do
		dosage "100 ml."
		association :vaccine
		association :visit
	end	
end