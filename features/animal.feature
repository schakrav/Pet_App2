Feature: Owner information
	In order to track my veterinary visits
	As a client
	I want to be able to list, create, update, and delete animal information

		Background:
			Given an initial business

				Scenario: List Animals
					Given that I am on the 'animals' page
					Then for the "title", I should see "Pet App | Animal Listing"
					And for the "th", I should see "Name"
					And for the "th", I should see "Female"
					And for the "th", I should see "Active"
					And for the "td", I should see "Zaz"
					And for the "td", I should see "true"
					And for the "td", I should see "true"
					And for the "body", I should see "Listing pets"
					And for the "body", I should see a link to "Add New Pet"

				Scenario: Create Pet
					Given that I am on the 'New Pet' page
					When I enter "Whitley" for "Name"
					And I check the "Female" box
					And I check the "Active" box
					And I click the "Create Pet" button
					Then I should get to see "Your Pet was successfully created!"
					And I should get to see "Name:"
					And I should get to see "Whitley"
					And I should get to see "Female:"
					And I should get to see "true"
					And I should get to see "Active:"
					And I should get to see "true"
					
				Scenario: Update Pet
					Given that I am on the 'pets' page
					When I click the "Edit" link for "Zaz"
					And I change the Name to "Rukhsar"
					And I click the "Update Pet" button
					Then I should see "Your Pet was successfully updated!"

				Scenario: Delete Pet
   					Given that I am on the 'pets' page
    				When I click the "Destroy" link for "Zaz"
    				Then I should not see "Zaz"	