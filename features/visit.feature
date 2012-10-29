Feature: Visit information
	In order to track my veterinary visits
	As a client
	I want to be able to list, create, update, and delete visit information

		Background:
			Given an initial business

				Scenario: List Visits
					Given that I am on the 'visits' page
					Then for the "title", I should see "Pet App | Visit Listing"
					And for the "th", I should see "Visit Date"
					And for the "th", I should see "Weight"
					And for the "th", I should see "Notes"
					And for the "td", I should see "2012-10-26"
					And for the "td", I should see 69
					And for the "td", I should see "Regular Check-up"
					And for the "body", I should see "Listing Visits"
					And for the "body", I should see a link to "Add New Visit"

				Scenario: Create Visit
					Given that I am on the 'New Pet' page
					When I enter "Whitley" for "Name"
					And I check the "Female" box
					And I check the "Active" box
					And I select "2007" for "pet_date_of_birth_1i"
					And I select "January" for "pet_date_of_birth_2i"
					And I select "19" for "pet_date_of_birth_3i"
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
					
				Scenario: Update Visit
					Given that I am on the 'pets' page
					When I click the "Edit" link for "Zaz"
					And I change the Name to "Rukhsar"
					And I click the "Update Pet" button
					Then I should see "Your Pet was successfully updated!"

				Scenario: Delete Visit
   					Given that I am on the 'pets' page
    				When I click the "Destroy" link for "Zaz"
    				Then I should not see "Zaz"	