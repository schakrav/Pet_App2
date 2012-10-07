require 'spec_helper'

describe "owners/new" do
  before(:each) do
    assign(:owner, stub_model(Owner,
      :firstname => "MyString",
      :lastname => "MyString",
      :address => "MyString",
      :city => "MyString",
      :country => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :active => false
    ).as_new_record)
  end

  it "renders new owner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => owners_path, :method => "post" do
      assert_select "input#owner_firstname", :name => "owner[firstname]"
      assert_select "input#owner_lastname", :name => "owner[lastname]"
      assert_select "input#owner_address", :name => "owner[address]"
      assert_select "input#owner_city", :name => "owner[city]"
      assert_select "select#owner_country", :name => "owner[country]"
      assert_select "input#owner_email", :name => "owner[email]"
      assert_select "input#owner_phone", :name => "owner[phone]"
      assert_select "input#owner_active", :name => "owner[active]"
    end
  end
end
