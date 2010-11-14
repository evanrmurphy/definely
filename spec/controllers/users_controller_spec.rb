require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end

    it "should show the user's entries" do
      entry1 = Factory(:entry, :user => @user, :word => "foo", :definition => "the thing preceding bar")
      entry2 = Factory(:entry, :user => @user, :word => "bar", :definition => "the thing that follows foo")
      get :show, :id => @user
      response.should have_selector(".word", :content => entry1.word)
      response.should have_selector(".definition", :content => entry1.definition)
      response.should have_selector(".word", :content => entry2.word)
      response.should have_selector(".definition", :content => entry2.definition)
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Sign up")
    end
  end
end
