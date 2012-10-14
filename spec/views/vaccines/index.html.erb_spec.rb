require 'spec_helper'

describe "vaccines/index" do
  before(:each) do
    assign(:vaccines, [
      stub_model(Vaccine,
        :name => "Name",
        :animal_id => 1,
        :duration => 2
      ),
      stub_model(Vaccine,
        :name => "Name",
        :animal_id => 1,
        :duration => 2
      )
    ])
  end

  it "renders a list of vaccines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
