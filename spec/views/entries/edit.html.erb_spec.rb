require 'spec_helper'

describe "entries/edit.html.erb" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :new_record? => false,
      :word => "MyString",
      :definition => "MyText"
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => entry_path(@entry), :method => "post" do
      assert_select "input#entry_word", :name => "entry[word]"
      assert_select "textarea#entry_definition", :name => "entry[definition]"
    end
  end
end
