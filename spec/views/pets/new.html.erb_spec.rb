require 'spec_helper'

describe "pets/new" do
  before(:each) do
    assign(:pet, stub_model(Pet,
      :animal_id => 1,
      :owner_id => 1,
      :name => "MyString",
      :female => false,
      :active => false
    ).as_new_record)
  end

  it "renders new pet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pets_path, :method => "post" do
      assert_select "input#pet_animal_id", :name => "pet[animal_id]"
      assert_select "input#pet_owner_id", :name => "pet[owner_id]"
      assert_select "input#pet_name", :name => "pet[name]"
      assert_select "input#pet_female", :name => "pet[female]"
      assert_select "input#pet_active", :name => "pet[active]"
    end
  end
end
