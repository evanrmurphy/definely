class EntriesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @entry  = current_user.entries.build(params[:entry])
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end
