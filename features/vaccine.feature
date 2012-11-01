Feature: Vaccine information
	In order to track my veterinary vaccines
	As a client
	I want to be able to list, create, update, and delete vaccine information

		Background:
			Given an initial business

				Scenario: List Vaccines
					Given that I am on the 'Vaccines' page
					Then for the "title", I should see "Pet App | Vaccine Listing"
					And for the "th", I should see "Name"
					And for the "th", I should see "Animal"
					And for the "th", I should see "Duration"
					And for the "td", I should see "Canine Distemper"
					And for the "td", I should see "2"
					And for the "td", I should see "366"
				
					

				Scenario: Create Vaccine
					Given that I am on the 'New Vaccine' page
				
					
				Scenario: Update Vaccine
					Given that I am on the 'Vaccines' page
					
					
				Scenario: Delete Vaccine
   					Given that I am on the 'Vaccines' page
    				
    					
    		