require 'spec_helper'

describe "better_entries/edit.html.erb" do
  before(:each) do
    @better_entry = assign(:better_entry, stub_model(BetterEntry,
      :new_record? => false,
      :user_id => 1,
      :word => "MyString",
      :definition => "MyText"
    ))
  end

  it "renders the edit better_entry form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => better_entry_path(@better_entry), :method => "post" do
      assert_select "input#better_entry_user_id", :name => "better_entry[user_id]"
      assert_select "input#better_entry_word", :name => "better_entry[word]"
      assert_select "textarea#better_entry_definition", :name => "better_entry[definition]"
    end
  end
end
