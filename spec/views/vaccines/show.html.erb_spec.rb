require 'spec_helper'

describe "vaccines/show" do
  before(:each) do
    @vaccine = assign(:vaccine, stub_model(Vaccine,
      :name => "Name",
      :animal_id => 1,
      :duration => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
