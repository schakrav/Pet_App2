Feature: Animal information
	In order to track my veterinary visits
	As a client
	I want to be able to list, create, update, and delete animal information

		Background:
			Given an initial business

				Scenario: List Animals
					Given that I am on the 'animals' page
					Then for the "title", I should see "Pet App | Animal Listing"
					And for the "th", I should see "Name"
					And for the "td", I should see "German Shepherd"
					And for the "body", I should see "Listing Animals"
					And for the "body", I should see a link to "Add New Animal"

				Scenario: Create Animal
					Given that I am on the 'New Animal' page
					Then for the "title", I should see "Pet App | Register Breed"
					When I enter "Pug" for "Name"
					And I click the "Create Animal" button
					Then I should get to see "Animal was successfully created!"
					And I should get to see "Name:"
					And I should get to see "Pug"
						
				Scenario: Update Animal
					Given that I am on the 'animals' page
					When I totally click the "Edit" link for "German Shepherd"
					And I change the Name to "Dalmatian"
					And I click the "Update Animal" button
					Then I should see "Animal was successfully updated!"
					And I should see "Name: Dalmatian"

				Scenario: Delete Animal
   					Given that I am on the 'animals' page
    				When I totally click the "Destroy" link for "Pug"
    				Then I should not see "Pug"	