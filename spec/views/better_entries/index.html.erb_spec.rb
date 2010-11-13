require 'spec_helper'

describe "better_entries/index.html.erb" do
  before(:each) do
    assign(:better_entries, [
      stub_model(BetterEntry,
        :user_id => 1,
        :word => "Word",
        :definition => "MyText"
      ),
      stub_model(BetterEntry,
        :user_id => 1,
        :word => "Word",
        :definition => "MyText"
      )
    ])
  end

  it "renders a list of better_entries" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
