require 'spec_helper'

describe "dictionary_entries/index.html.erb" do
  before(:each) do
    assign(:dictionary_entries, [
      stub_model(DictionaryEntry,
        :user_id => 1,
        :word => "Word",
        :definition => "Definition"
      ),
      stub_model(DictionaryEntry,
        :user_id => 1,
        :word => "Word",
        :definition => "Definition"
      )
    ])
  end

  it "renders a list of dictionary_entries" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Definition".to_s, :count => 2
  end
end
