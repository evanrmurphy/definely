require 'spec_helper'

describe DictionaryEntriesController do

  def mock_dictionary_entry(stubs={})
    (@mock_dictionary_entry ||= mock_model(DictionaryEntry).as_null_object).tap do |dictionary_entry|
      dictionary_entry.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all dictionary_entries as @dictionary_entries" do
      DictionaryEntry.stub(:all) { [mock_dictionary_entry] }
      get :index
      assigns(:dictionary_entries).should eq([mock_dictionary_entry])
    end
  end

  describe "GET show" do
    it "assigns the requested dictionary_entry as @dictionary_entry" do
      DictionaryEntry.stub(:find).with("37") { mock_dictionary_entry }
      get :show, :id => "37"
      assigns(:dictionary_entry).should be(mock_dictionary_entry)
    end
  end

  describe "GET new" do
    it "assigns a new dictionary_entry as @dictionary_entry" do
      DictionaryEntry.stub(:new) { mock_dictionary_entry }
      get :new
      assigns(:dictionary_entry).should be(mock_dictionary_entry)
    end
  end

  describe "GET edit" do
    it "assigns the requested dictionary_entry as @dictionary_entry" do
      DictionaryEntry.stub(:find).with("37") { mock_dictionary_entry }
      get :edit, :id => "37"
      assigns(:dictionary_entry).should be(mock_dictionary_entry)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created dictionary_entry as @dictionary_entry" do
        DictionaryEntry.stub(:new).with({'these' => 'params'}) { mock_dictionary_entry(:save => true) }
        post :create, :dictionary_entry => {'these' => 'params'}
        assigns(:dictionary_entry).should be(mock_dictionary_entry)
      end

      it "redirects to the created dictionary_entry" do
        DictionaryEntry.stub(:new) { mock_dictionary_entry(:save => true) }
        post :create, :dictionary_entry => {}
        response.should redirect_to(dictionary_entry_url(mock_dictionary_entry))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dictionary_entry as @dictionary_entry" do
        DictionaryEntry.stub(:new).with({'these' => 'params'}) { mock_dictionary_entry(:save => false) }
        post :create, :dictionary_entry => {'these' => 'params'}
        assigns(:dictionary_entry).should be(mock_dictionary_entry)
      end

      it "re-renders the 'new' template" do
        DictionaryEntry.stub(:new) { mock_dictionary_entry(:save => false) }
        post :create, :dictionary_entry => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested dictionary_entry" do
        DictionaryEntry.should_receive(:find).with("37") { mock_dictionary_entry }
        mock_dictionary_entry.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dictionary_entry => {'these' => 'params'}
      end

      it "assigns the requested dictionary_entry as @dictionary_entry" do
        DictionaryEntry.stub(:find) { mock_dictionary_entry(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:dictionary_entry).should be(mock_dictionary_entry)
      end

      it "redirects to the dictionary_entry" do
        DictionaryEntry.stub(:find) { mock_dictionary_entry(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(dictionary_entry_url(mock_dictionary_entry))
      end
    end

    describe "with invalid params" do
      it "assigns the dictionary_entry as @dictionary_entry" do
        DictionaryEntry.stub(:find) { mock_dictionary_entry(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:dictionary_entry).should be(mock_dictionary_entry)
      end

      it "re-renders the 'edit' template" do
        DictionaryEntry.stub(:find) { mock_dictionary_entry(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested dictionary_entry" do
      DictionaryEntry.should_receive(:find).with("37") { mock_dictionary_entry }
      mock_dictionary_entry.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the dictionary_entries list" do
      DictionaryEntry.stub(:find) { mock_dictionary_entry }
      delete :destroy, :id => "1"
      response.should redirect_to(dictionary_entries_url)
    end
  end

end
