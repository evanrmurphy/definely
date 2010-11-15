class PagesController < ApplicationController

  def home
    @title = "Home"
    @entry = Entry.new if signed_in?
  end
end
