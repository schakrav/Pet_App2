require 'spec_helper'

describe "vaccinations/show" do
  before(:each) do
    @vaccination = assign(:vaccination, stub_model(Vaccination,
      :vaccine_id => 1,
      :visit_id => 2,
      :dosage => "Dosage"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Dosage/)
  end
end
