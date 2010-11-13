require 'spec_helper'

describe "dictionary_entries/edit.html.erb" do
  before(:each) do
    @dictionary_entry = assign(:dictionary_entry, stub_model(DictionaryEntry,
      :new_record? => false,
      :user_id => 1,
      :word => "MyString",
      :definition => "MyString"
    ))
  end

  it "renders the edit dictionary_entry form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => dictionary_entry_path(@dictionary_entry), :method => "post" do
      assert_select "input#dictionary_entry_user_id", :name => "dictionary_entry[user_id]"
      assert_select "input#dictionary_entry_word", :name => "dictionary_entry[word]"
      assert_select "input#dictionary_entry_definition", :name => "dictionary_entry[definition]"
    end
  end
end
