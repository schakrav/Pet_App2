Feature: Owner Information

In order to bill my clients
As a vet
I want to record owner information

	Scenario: title
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
