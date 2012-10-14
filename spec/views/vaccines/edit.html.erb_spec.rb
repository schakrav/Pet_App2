require 'spec_helper'

describe "vaccines/edit" do
  before(:each) do
    @vaccine = assign(:vaccine, stub_model(Vaccine,
      :name => "MyString",
      :animal_id => 1,
      :duration => 1
    ))
  end

  it "renders the edit vaccine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vaccines_path(@vaccine), :method => "post" do
      assert_select "input#vaccine_name", :name => "vaccine[name]"
      assert_select "input#vaccine_animal_id", :name => "vaccine[animal_id]"
      assert_select "input#vaccine_duration", :name => "vaccine[duration]"
    end
  end
end
