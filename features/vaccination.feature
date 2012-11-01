Feature: Vaccination information
	In order to track my veterinary vaccinations
	As a client
	I want to be able to list, create, update, and delete vaccinations information

		Background:
			Given an initial business

				Scenario: List Vaccinations
					Given that I am on the 'Vaccinations' page
					Then for the "title", I should see "Pet App | Vaccination Listing"
					And for the "th", I should see "Vaccine"
					And for the "th", I should see "Visit"
					And for the "th", I should see "Dosage"
					And for the "td", I should see "1"
					And for the "td", I should see "1"
					And for the "td", I should see "100 ml."
					And for the "body", I should see "Listing Vaccinations"
					And for the "body", I should see a link to "Add New Vaccination"
			
				Scenario: Create Vaccinations
					Given that I am on the 'New Vaccination' page
					And I enter "1" for "Vaccine"
					And I enter "1" for "Visit"
					And I enter "50 ml." for "Dosage"
					And I click the "Create Vaccination" button
					Then I should get to see "Vaccination was successfully created."
					And I should get to see "Vaccine:"
					And I should get to see "1"
					And I should get to see "Visit:"
					And I should get to see "1"
					And I should get to see "Dosage:"
					And I should get to see "50 ml."
			
				Scenario: Update Vaccinations
					Given that I am on the 'Vaccinations' page
					When I left-click the "Edit" link for "100 ml."
					And I change the "Dosage" field to "220 ml."
					And I click the "Update Vaccination" button
					Then I should see "Vaccination was successfully updated."
					And I should see "Dosage: 220 ml."
					
			
				Scenario: Delete Vaccinations
   					Given that I am on the 'Vaccinations' page
   					When I left-click the "Destroy" link for "20 mg."
    				Then I should not see "20 mg."	
   					
    					
    				
    					
    		