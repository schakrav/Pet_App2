Given /^an initial business$/ do
  @srinjoy = FactoryGirl.create(:owner, :firstname => "Srinjoy", :lastname => "Chakravarty", :address => "704-B The Pearl Qatar", :city => "Doha", :country => "QA", :phone => "97444724223", :email => "chaxz93@gmail.com", :active => true)
  @rishika = FactoryGirl.create(:owner, :firstname => "Rishika", :lastname => "Xi", :address => "MapleWood Street", :city => "Silkeborg", :country => "DEN", :phone => "97444724223", :email => "rishikaachy@yahoo.com", :active => false)
  
  @german_shepherd = FactoryGirl.create(:animal, :name => "German Shepherd")
  @pug = FactoryGirl.create(:animal, :name => "Pug")
  
  @zaz = FactoryGirl.create(:pet, :owner => @srinjoy, :name => "Zaz", :female => true, :date_of_birth => 5.years.ago.to_date, :animal => @german_shepherd, :active => true)
  @didum = FactoryGirl.create(:pet, :owner => @rishika, :name => "Didum", :female => false, :date_of_birth => 2.years.ago.to_date, :animal => @pug, :active => true)
  
  @visit_1 = FactoryGirl.create(:visit, :weight => 69, :visit_date => 3.days.ago.to_date, :notes => "Regular Check-up", :pet => @zaz)
  @visit_2 = FactoryGirl.create(:visit, :weight => 39, :visit_date => 2.days.ago.to_date, :notes => "No worries", :pet => @didum)
  
  @canine_distemper = FactoryGirl.create(:vaccine, :name => "Canine Distemper", :duration => 366, :animal => @german_shepherd)
  @rattlesnake_envenomation = FactoryGirl.create(:vaccine, :name => "Rattlesnake Envenomation", :duration => 58, :animal => @pug)
  
  @zaz_caninedistemper = FactoryGirl.create(:vaccination, :dosage => "100 ml.", :vaccine =>  @canine_distemper, :visit => @visit_1)
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








