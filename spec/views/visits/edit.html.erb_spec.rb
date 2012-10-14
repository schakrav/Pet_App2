require 'spec_helper'

describe "visits/edit" do
  before(:each) do
    @visit = assign(:visit, stub_model(Visit,
      :pet_id => 1,
      :weight => 1,
      :notes => "MyText"
    ))
  end

  it "renders the edit visit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => visits_path(@visit), :method => "post" do
      assert_select "input#visit_pet_id", :name => "visit[pet_id]"
      assert_select "input#visit_weight", :name => "visit[weight]"
      assert_select "textarea#visit_notes", :name => "visit[notes]"
    end
  end
end
