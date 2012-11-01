Given /^that I am on the 'Vaccines' page$/ do
	visit vaccines_path 
end

Given /^that I am on the 'New Vaccine' page$/ do
  	visit new_vaccine_path
end

When /^I do click the "(.*?)" link for "(.*?)"$/ do |link, entry|
	within_table('Vaccine List') do
    	within('tr', :text => entry) do
      		find('a', :text => link).click
    	end
  	end    
end
