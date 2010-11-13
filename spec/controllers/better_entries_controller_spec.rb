require 'spec_helper'

describe BetterEntriesController do

  def mock_better_entry(stubs={})
    (@mock_better_entry ||= mock_model(BetterEntry).as_null_object).tap do |better_entry|
      better_entry.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all better_entries as @better_entries" do
      BetterEntry.stub(:all) { [mock_better_entry] }
      get :index
      assigns(:better_entries).should eq([mock_better_entry])
    end
  end

  describe "GET show" do
    it "assigns the requested better_entry as @better_entry" do
      BetterEntry.stub(:find).with("37") { mock_better_entry }
      get :show, :id => "37"
      assigns(:better_entry).should be(mock_better_entry)
    end
  end

  describe "GET new" do
    it "assigns a new better_entry as @better_entry" do
      BetterEntry.stub(:new) { mock_better_entry }
      get :new
      assigns(:better_entry).should be(mock_better_entry)
    end
  end

  describe "GET edit" do
    it "assigns the requested better_entry as @better_entry" do
      BetterEntry.stub(:find).with("37") { mock_better_entry }
      get :edit, :id => "37"
      assigns(:better_entry).should be(mock_better_entry)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created better_entry as @better_entry" do
        BetterEntry.stub(:new).with({'these' => 'params'}) { mock_better_entry(:save => true) }
        post :create, :better_entry => {'these' => 'params'}
        assigns(:better_entry).should be(mock_better_entry)
      end

      it "redirects to the created better_entry" do
        BetterEntry.stub(:new) { mock_better_entry(:save => true) }
        post :create, :better_entry => {}
        response.should redirect_to(better_entry_url(mock_better_entry))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved better_entry as @better_entry" do
        BetterEntry.stub(:new).with({'these' => 'params'}) { mock_better_entry(:save => false) }
        post :create, :better_entry => {'these' => 'params'}
        assigns(:better_entry).should be(mock_better_entry)
      end

      it "re-renders the 'new' template" do
        BetterEntry.stub(:new) { mock_better_entry(:save => false) }
        post :create, :better_entry => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested better_entry" do
        BetterEntry.should_receive(:find).with("37") { mock_better_entry }
        mock_better_entry.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :better_entry => {'these' => 'params'}
      end

      it "assigns the requested better_entry as @better_entry" do
        BetterEntry.stub(:find) { mock_better_entry(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:better_entry).should be(mock_better_entry)
      end

      it "redirects to the better_entry" do
        BetterEntry.stub(:find) { mock_better_entry(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(better_entry_url(mock_better_entry))
      end
    end

    describe "with invalid params" do
      it "assigns the better_entry as @better_entry" do
        BetterEntry.stub(:find) { mock_better_entry(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:better_entry).should be(mock_better_entry)
      end

      it "re-renders the 'edit' template" do
        BetterEntry.stub(:find) { mock_better_entry(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested better_entry" do
      BetterEntry.should_receive(:find).with("37") { mock_better_entry }
      mock_better_entry.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the better_entries list" do
      BetterEntry.stub(:find) { mock_better_entry }
      delete :destroy, :id => "1"
      response.should redirect_to(better_entries_url)
    end
  end

end
