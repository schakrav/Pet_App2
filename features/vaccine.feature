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
					And for the "body", I should see "Listing Vaccines"
					And for the "body", I should see a link to "Add New Vaccine"
				
				Scenario: Create Vaccine
					Given that I am on the 'New Vaccine' page
					And I enter "Rabies" for "Name"
					And I enter "1" for "Animal"
					And I enter "250" for "Duration"
					And I click the "Create Vaccine" button
					Then I should get to see "Vaccine was successfully created."
					And I should get to see "Name:"
					And I should get to see "Rabies"
					And I should get to see "Animal:"
					And I should get to see "2"
					And I should get to see "Duration:"
					And I should get to see "250"
				
				Scenario: Update Vaccine
					Given that I am on the 'Vaccines' page
					When I do click the "Edit" link for "Canine Distemper"
					And I change the "Name" field to "Leukemia"
					And I click the "Update Vaccine" button
					Then I should see "Vaccine was successfully updated."
					And I should see "Name: Leukemia"
					
				Scenario: Delete Vaccine
   					Given that I am on the 'Vaccines' page
   					When I do click the "Destroy" link for "Rattlesnake Envenomation"
    				Then I should not see "Rattlesnake Envenomation"	
    					
    				
    					
    		