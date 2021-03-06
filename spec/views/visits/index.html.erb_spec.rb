require 'spec_helper'

describe "visits/index" do
  before(:each) do
    assign(:visits, [
      stub_model(Visit,
        :pet_id => 1,
        :weight => 2,
        :notes => "MyText"
      ),
      stub_model(Visit,
        :pet_id => 1,
        :weight => 2,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of visits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
