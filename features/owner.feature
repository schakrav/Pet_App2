Feature: Owner information

In order to track my clients
As a vet
I want to be able to list, create, update, and delete pet owner information

	Background:
		Given an initial business
	
	Scenario: Follow destroy link
   
    	Given I am on the 'owners' page
    	When I follow the "Destroy" link for "chaxz93@gmail.com "
    	Then I should not find "Srinjoy"

	Scenario: List Owner
	
		Given I am on the 'owners' page
		Then in the "title", I should see "Pet App| Owners"
		And in the "th", I should see "Owner"
		And in the "th", I should see "Country"
		And in the "th", I should see "Email"
		And in the "th", I should see "Active"
		And in the "td", I should see "Srinjoy Chakravarty"
		And in the "td", I should see "QA"
		And in the "td", I should see "chaxz93@gmail.com"
		And in the "td", I should see "true"
		And in the "td", I should see "Show"
		And in the "td", I should see "Edit"
		And in the "td", I should see "Destroy"
		And in the "body", I should see a link to "Add a New Owner"

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

