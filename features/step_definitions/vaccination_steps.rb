Given /^that I am on the 'Vaccinations' page$/ do
	visit vaccinations_path 
end

Given /^that I am on the 'New Vaccination' page$/ do
	visit new_vaccination_path
end

When /^I left\-click the "(.*?)" link for "(.*?)"$/ do |link, entry|
	within_table('Vaccination List') do
    	within('tr', :text => entry) do
      		find('a', :text => link).click
    	end
  	end  
end
