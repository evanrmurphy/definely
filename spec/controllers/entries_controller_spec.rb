require 'spec_helper'

describe EntriesController do
  render_views

  describe "access control" do
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do
  
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
  
    describe "failure" do
      before(:each) do
        @attr = { :word => "", :definition => "" }
      end
  
      it "should not create an entry" do
        lambda do
          post :create, :entry => @attr
        end.should_not change(Entry, :count)
      end
  
      it "should render the home page" do
        post :create, :entry => @attr
        response.should render_template('pages/home')
      end
    end
  
    describe "success" do
      before(:each) do
        @attr = { :word => "foo", :definition => "that which precedes bar" }
      end
  
      it "should create a entry" do
        lambda do
          post :create, :entry => @attr
        end.should change(Entry, :count).by(1)
      end
  
      it "should redirect to the home page" do
        post :create, :entry => @attr
        response.should redirect_to(root_path)
      end
  
      it "should have a flash message" do
        post :create, :entry => @attr
        flash[:success].should =~ /entry created/i
      end
    end
  end
end
