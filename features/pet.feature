Feature: Pet information
	In order to track my veterinary visits
	As a client
	I want to be able to list, create, update, and delete pet information

		Background:
			Given an initial business

				Scenario: List Pets
					Given that I am on the 'pets' page
					Then for the "title", I should see "Pet App | Pet Listing"
					And for the "th", I should see "Name"
					And for the "th", I should see "Female"
					And for the "th", I should see "Date of birth"
					And for the "th", I should see "Active"
					And for the "th", I should see "Owner"
					And for the "th", I should see "Animal"
					And for the "td", I should see "Zaz"
					And for the "td", I should see "true"
					And for the "td", I should see "true"
					And for the "td", I should see "1"
					And for the "td", I should see "2"
					And for the "body", I should see "Listing Pets"
					And for the "body", I should see a link to "Add New Pet"

				Scenario: Create Pet
					Given that I am on the 'New Pet' page
					Then for the "title", I should see "Pet App | Pet Sign up"
					When I enter "Whitley" for "Name"
					And I check the "Female" box
					And I select "2007" for "pet_date_of_birth_1i"
					And I select "January" for "pet_date_of_birth_2i"
					And I select "19" for "pet_date_of_birth_3i"
					And I check the "Active" box
					And I enter "1" for "Owner"
					And I enter "2" for "Animal"
					And I click the "Create Pet" button
					Then I should get to see "Your Pet was successfully created!"
					And I should get to see "Name:"
					And I should get to see "Whitley"
					And I should get to see "Female:"
					And I should get to see "true"
					And I should get to see "Date of birth:"
					And I should get to see "2007-01-19"
					And I should get to see "Active:"
					And I should get to see "true"
					And I should get to see "Owner:"
					And I should get to see "1"
					And I should get to see "Animal:"
					And I should get to see "2"
					
				Scenario: Update Pet
					Given that I am on the 'pets' page
					When I click the "Edit" link for "Zaz"
					And I change the Name to "Noah"
					And I click the "Update Pet" button
					Then I should see "Your Pet was successfully updated!"
					And I should see "Name: Noah"

				Scenario: Delete Pet
   					Given that I am on the 'pets' page
    				When I click the "Destroy" link for "Didum"
    				Then I should not see "Didum"	