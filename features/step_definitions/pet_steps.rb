Given /^that I am on the 'pets' page$/ do
	visit pets_path 
end

Given /^that I am on the 'New Pet' page$/ do
  visit new_pet_path
end

When /^I change the Name to "(.*?)"$/ do |newname|
   fill_in "Name", :with => newname
end

When /^I click the "(.*?)" link for "(.*?)"$/ do |link, value|
   within_table('Pet List') do
    within('tr', :text => value) do
      find('a', :text => link).click
    end
  end    
end






