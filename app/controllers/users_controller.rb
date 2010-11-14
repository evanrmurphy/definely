class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @entries = @user.entries.paginate(:page => params[:page])
    @title = @user.name
  end

  def new
    @title = "Sign up"
  end
end
