Given /^an initial business$/ do
  @srinjoy = FactoryGirl.create(:owner)
end

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

Given /^I am on the 'owners' page$/ do
  visit owners_path
end

Then /^for the "(.*?)", I should see "(.*?)"$/ do |csstag, textvalue|
  page.should have_css(csstag, :text => textvalue)
end

Then /^for the "(.*?)", I should see a link to "(.*?)"$/ do |csstag, textvalue|
  within csstag do
    page.should have_link textvalue
  end
end

When /^I follow the "(.*?)" link for "(.*?)"$/ do |crud_link, identifier|
   within(:css, 'Owner List') do
    within(:css, 'tr', :text => identifier) do
      find(:css, 'a', :text => crud_link).click 
    end
  end 
end

#When /^I follow the "(.*?)" link for "(.*?)"$/ do |crud_link, identifier|
#   within_table('Owner List') do
#    within('tr', :text => identifier) do
#      find('a', :text => crud_link).click 
 #   end
 # end 
#end

Then /^I should not find "(.*?)"$/ do |identifier|
    page.should_not have_content(identifier)
end



When /^I change the email address "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see$/ do
  pending # express the regexp above with the code you wish you had
end




