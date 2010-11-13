require 'spec_helper'

describe "dictionary_entries/show.html.erb" do
  before(:each) do
    @dictionary_entry = assign(:dictionary_entry, stub_model(DictionaryEntry,
      :user_id => 1,
      :word => "Word",
      :definition => "Definition"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Word/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Definition/)
  end
end
