Given /^I am on the 'New Owner' page$/ do
  visit new_owner_path
end

When /^I enter "(.*?)" for "(.*?)"$/ do |value, field|
  fill_in field, :with => value
end

When /^I select "(.*?)" for "(.*?)"$/ do |value, field|
 select value, :from => field
end

When /^I check the "(.*?)" box$/ do |check_box_name|
  check check_box_name
end

When /^I click the "(.*?)" button$/ do |buttonname|
  click_button buttonname
end

Then /^I should get to see "(.*?)"$/ do |value|
  page.should have_content value
end





