Given /^that I am on the 'visits' page$/ do
	visit visits_path 
end

Given /^that I am on the 'New Visit' page$/ do
  visit new_visit_path
end

When /^I go click the "(.*?)" link for "(.*?)"$/ do |link, value|
	within_table('Visit List') do
    	within('tr', :text => value) do
      		find('a', :text => link).click
    	end
  	end    
end

When /^I change the "(.*?)" field to "(.*?)"$/ do |field, new_value|
	 fill_in field, :with => new_value
end

