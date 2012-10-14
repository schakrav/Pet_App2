require 'spec_helper'

describe "vaccinations/new" do
  before(:each) do
    assign(:vaccination, stub_model(Vaccination,
      :vaccine_id => 1,
      :visit_id => 1,
      :dosage => "MyString"
    ).as_new_record)
  end

  it "renders new vaccination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vaccinations_path, :method => "post" do
      assert_select "input#vaccination_vaccine_id", :name => "vaccination[vaccine_id]"
      assert_select "input#vaccination_visit_id", :name => "vaccination[visit_id]"
      assert_select "input#vaccination_dosage", :name => "vaccination[dosage]"
    end
  end
end
