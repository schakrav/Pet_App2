require 'spec_helper'

describe "owners/show" do
  before(:each) do
    @owner = assign(:owner, stub_model(Owner,
      :firstname => "Firstname",
      :lastname => "Lastname",
      :address => "Address",
      :city => "City",
      :country => "Country",
      :email => "Email",
      :phone => "Phone",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Firstname/)
    rendered.should match(/Lastname/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/false/)
  end
end
