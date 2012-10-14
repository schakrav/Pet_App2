require 'spec_helper'

describe "visits/show" do
  before(:each) do
    @visit = assign(:visit, stub_model(Visit,
      :pet_id => 1,
      :weight => 2,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
  end
end
