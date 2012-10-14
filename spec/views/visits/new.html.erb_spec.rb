require 'spec_helper'

describe "visits/new" do
  before(:each) do
    assign(:visit, stub_model(Visit,
      :pet_id => 1,
      :weight => 1,
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new visit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => visits_path, :method => "post" do
      assert_select "input#visit_pet_id", :name => "visit[pet_id]"
      assert_select "input#visit_weight", :name => "visit[weight]"
      assert_select "textarea#visit_notes", :name => "visit[notes]"
    end
  end
end
