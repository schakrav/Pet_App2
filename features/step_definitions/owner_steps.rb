Given /^an initial business$/ do
  @rishika = FactoryGirl.create(:owner, :firstname => "Rishika", :lastname => "Xi", :address => "MapleWood Street", :city => "Silkeborg", :country => "DEN", :phone => "97444724223", :email => "rishikaachy@yahoo.com", :active => false)
  
  @german_shepherd = FactoryGirl.create(:animal)
  @pug = FactoryGirl.create(:animal, :name => "Pug")
  
  @zaz = FactoryGirl.create(:pet)
  @didum = FactoryGirl.create(:pet, :name => "Didum", :female => false, :date_of_birth => 2.years.ago.to_date, :animal => @pug)
  
  @visit_1 = FactoryGirl.create(:visit)
  @visit_2 = FactoryGirl.create(:visit, :weight => 39, :visit_date => 2.days.ago.to_date, :notes => "No worries", :pet => @didum)
  
  @canine_distemper = FactoryGirl.create(:vaccine)
  @rattlesnake_envenomation = FactoryGirl.create(:vaccine, :name => "Rattlesnake Envenomation", :duration => 58, :animal => @pug)
  
  @zaz_caninedistemper = FactoryGirl.create(:vaccination)
  @didum_rattlesnakeenvenomation  = FactoryGirl.create(:vaccination, :dosage => "20 mg.", :vaccine =>  @rattlesnake_envenomation, :visit => @visit_2)
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

#When /^I follow the "(.*?)" link for "(.*?)"$/ do |crud_link, cell_name|
 # find(:xpath, "//tr[contains(.,'#{cell_name}')]").click_link crud_link
#end

When /^I follow the "(.*?)" link for "(.*?)"$/ do |crud_link, cell_value|
  within_table('Owner List') do
    within('tr', :text => cell_value) do
      find('a', :text => crud_link).click
    end
  end    
end

When /^I change the email address to "(.*?)"$/ do |newmail|
   fill_in "Email", :with => newmail
end








