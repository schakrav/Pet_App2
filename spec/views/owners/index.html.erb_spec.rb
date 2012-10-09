require 'spec_helper'

describe "owners/index" do
  before(:each) do
    assign(:owners, [
      stub_model(Owner,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :city => "City",
        :country => "Country",
        :email => "Email",
        :phone => "Phone",
        :active => false
      ),
      stub_model(Owner,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :city => "City",
        :country => "Country",
        :email => "Email",
        :phone => "Phone",
        :active => false
      )
    ])
  end

 # it "renders a list of owners" do
  #  render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "tr>td", :text => "Firstname".to_s, :count => 2
   # assert_select "tr>td", :text => "Lastname".to_s, :count => 2
   # assert_select "tr>td", :text => "Address".to_s, :count => 2
  #  assert_select "tr>td", :text => "City".to_s, :count => 2
#  assert_select "tr>td", :text => "Country".to_s, :count => 2
  #  assert_select "tr>td", :text => "Email".to_s, :count => 2
    #assert_select "tr>td", :text => "Phone".to_s, :count => 2
  #  assert_select "tr>td", :text => false.to_s, :count => 2
#  end
end
