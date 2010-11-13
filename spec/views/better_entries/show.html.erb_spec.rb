require 'spec_helper'

describe "better_entries/show.html.erb" do
  before(:each) do
    @better_entry = assign(:better_entry, stub_model(BetterEntry,
      :user_id => 1,
      :word => "Word",
      :definition => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Word/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
