require 'spec_helper'

describe "dictionary_entries/new.html.erb" do
  before(:each) do
    assign(:dictionary_entry, stub_model(DictionaryEntry,
      :user_id => 1,
      :word => "MyString",
      :definition => "MyString"
    ).as_new_record)
  end

  it "renders new dictionary_entry form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => dictionary_entries_path, :method => "post" do
      assert_select "input#dictionary_entry_user_id", :name => "dictionary_entry[user_id]"
      assert_select "input#dictionary_entry_word", :name => "dictionary_entry[word]"
      assert_select "input#dictionary_entry_definition", :name => "dictionary_entry[definition]"
    end
  end
end
