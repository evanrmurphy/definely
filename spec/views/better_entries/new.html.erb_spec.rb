require 'spec_helper'

describe "better_entries/new.html.erb" do
  before(:each) do
    assign(:better_entry, stub_model(BetterEntry,
      :user_id => 1,
      :word => "MyString",
      :definition => "MyText"
    ).as_new_record)
  end

  it "renders new better_entry form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => better_entries_path, :method => "post" do
      assert_select "input#better_entry_user_id", :name => "better_entry[user_id]"
      assert_select "input#better_entry_word", :name => "better_entry[word]"
      assert_select "textarea#better_entry_definition", :name => "better_entry[definition]"
    end
  end
end
