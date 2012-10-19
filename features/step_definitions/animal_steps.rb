Given /^that I am on the 'animals' page$/ do
	visit animals_path 
end

Given /^that I am on the 'New Animal' page$/ do
  visit new_animal_path
end

When /^I totally click the "(.*?)" link for "(.*?)"$/ do |linkz, valuez|
   within_table('Animal List') do
    within('tr', :text => valuez) do
      find('a', :text => linkz).click
    end
  end   
end
