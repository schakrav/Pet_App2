Feature: Visit information
	In order to track my veterinary visits
	As a client
	I want to be able to list, create, update, and delete visit information

		Background:
			Given an initial business

				Scenario: List Visits
					Given that I am on the 'visits' page
					Then for the "title", I should see "Pet App | Visit Listing"
					And for the "th", I should see "Pet"
					And for the "th", I should see "Visit Date"
					And for the "th", I should see "Weight"
					And for the "th", I should see "Notes"
					And for the "td", I should see "1"
					And for the "td", I should see "69"
					And for the "td", I should see "Regular Check-up"
					And for the "body", I should see "Listing Visits"
					And for the "body", I should see a link to "Add New Visit"

				Scenario: Create Visit
					Given that I am on the 'New Visit' page
					Then for the "title", I should see "Pet App | Log Visit"
					And I enter "1" for "Pet"
					And I select "2009" for "visit_visit_date_1i"
					And I select "March" for "visit_visit_date_2i"
					And I select "4" for "visit_visit_date_3i"
					And I enter "25" for "Weight"
					And I enter "Initial Check Up" for "Notes"
					And I click the "Create Visit" button
					Then I should get to see "Your Visit was successfully recorded!"
					And I should get to see "Pet:"
					And I should get to see "1"
					And I should get to see "Visit date:"
					And I should get to see "2009-03-04"
					And I should get to see "Weight:"
					And I should get to see "25"
					And I should get to see "Notes:"
					And I should get to see "Initial Check Up"
					
				Scenario: Update Visit
					Given that I am on the 'visits' page
					When I go click the "Edit" link for "Regular Check-up"
					And I change the "Weight" field to "93"
					And I click the "Update Visit" button
					Then I should see "Visit was successfully updated."
					And I should see "Weight: 93"
					
				Scenario: Delete Visit
   					Given that I am on the 'visits' page
    				When I go click the "Destroy" link for "No worries"
    				Then I should not see "No worries"	
    					
    		