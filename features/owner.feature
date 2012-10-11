Feature: Owner information
	In order to track my clients
	As a vet
	I want to be able to list, create, update, and delete pet owner information

		Background:
			Given an initial business

				Scenario: List Owner
					Given I am on the 'owners' page
					Then for the "title", I should see "Pet App | Owners Listing"
					And for the "body", I should see "Listing owners"
					And for the "th", I should see "Owner"
					And for the "th", I should see "Country"
					And for the "th", I should see "Email"
					And for the "th", I should see "Active"
					And for the "td", I should see "Srinjoy Chakravarty"
					And for the "td", I should see "QA"
					And for the "td", I should see "chaxz93@gmail.com"
					And for the "td", I should see "true"
					And for the "body", I should see a link to "Add New Owner"
	
				Scenario: Follow destroy link
   					Given I am on the 'owners' page
    				When I follow the "Destroy" link for "chaxz93@gmail.com "
    				Then I should not find "Srinjoy"

				Scenario: Create Owner
					Given I am on the 'New Owner' page
					When I enter "Srinjoy" for "Firstname"
					And I enter "Chakravarty" for "Lastname"
					And I enter "chaxz93@gmail.com" for "Email"
					And I enter "55566090897" for "Phone"
					And I enter "The Pearl Qatar" for "Address" 
					And I enter "Doha" for "City"  
					And I select "Qatar" for "Country"
					And I check the "Active" box
					And I click the "Create Owner" button
					Then I should get to see "Created new owner Srinjoy Chakravarty!"
					And I should get to see "Name:"
					And I should get to see "Srinjoy Chakravarty"
					And I should get to see "Address:"
					And I should get to see "The Pearl Qatar"
					And I should get to see "Location:"
					And I should get to see "Doha, QA"
					And I should get to see "Email:"
					And I should get to see "chaxz93@gmail.com"
					And I should get to see "Phone:"
					And I should get to see "66090897"
					And I should get to see "Active with QATS: true" 

				Scenario: Edit Owner
					Given I am on the 'owners' page
					When I follow the "Edit" link for "Phelps, Joey"
					And I change the email address "joey" 
					Then I should see 

				Scenario: Update Owner
					Given I am on the 'owners' page
					When I follow the "Edit" link for "Phelps, Joey"
					And I change the email address "joey" 

