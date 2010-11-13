require "spec_helper"

describe DictionaryEntriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/dictionary_entries" }.should route_to(:controller => "dictionary_entries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/dictionary_entries/new" }.should route_to(:controller => "dictionary_entries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/dictionary_entries/1" }.should route_to(:controller => "dictionary_entries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/dictionary_entries/1/edit" }.should route_to(:controller => "dictionary_entries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/dictionary_entries" }.should route_to(:controller => "dictionary_entries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/dictionary_entries/1" }.should route_to(:controller => "dictionary_entries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/dictionary_entries/1" }.should route_to(:controller => "dictionary_entries", :action => "destroy", :id => "1")
    end

  end
end
