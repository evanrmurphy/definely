require "spec_helper"

describe BetterEntriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/better_entries" }.should route_to(:controller => "better_entries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/better_entries/new" }.should route_to(:controller => "better_entries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/better_entries/1" }.should route_to(:controller => "better_entries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/better_entries/1/edit" }.should route_to(:controller => "better_entries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/better_entries" }.should route_to(:controller => "better_entries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/better_entries/1" }.should route_to(:controller => "better_entries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/better_entries/1" }.should route_to(:controller => "better_entries", :action => "destroy", :id => "1")
    end

  end
end
