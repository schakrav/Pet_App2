Given /^that I am on the 'visits' page$/ do
	visit visits_path 
end

Then /^for the "(.*?)", I should see the number "(.*?)"$/ do |css_tag, num_value|
  page.should have_css(css_tag, :value => num_value)
end

