class BetterEntriesController < ApplicationController
  # GET /better_entries
  # GET /better_entries.xml
  def index
    @better_entries = BetterEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @better_entries }
    end
  end

  # GET /better_entries/1
  # GET /better_entries/1.xml
  def show
    @better_entry = BetterEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @better_entry }
    end
  end

  # GET /better_entries/new
  # GET /better_entries/new.xml
  def new
    @better_entry = BetterEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @better_entry }
    end
  end

  # GET /better_entries/1/edit
  def edit
    @better_entry = BetterEntry.find(params[:id])
  end

  # POST /better_entries
  # POST /better_entries.xml
  def create
    @better_entry = BetterEntry.new(params[:better_entry])

    respond_to do |format|
      if @better_entry.save
        format.html { redirect_to(@better_entry, :notice => 'Better entry was successfully created.') }
        format.xml  { render :xml => @better_entry, :status => :created, :location => @better_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @better_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /better_entries/1
  # PUT /better_entries/1.xml
  def update
    @better_entry = BetterEntry.find(params[:id])

    respond_to do |format|
      if @better_entry.update_attributes(params[:better_entry])
        format.html { redirect_to(@better_entry, :notice => 'Better entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @better_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /better_entries/1
  # DELETE /better_entries/1.xml
  def destroy
    @better_entry = BetterEntry.find(params[:id])
    @better_entry.destroy

    respond_to do |format|
      format.html { redirect_to(better_entries_url) }
      format.xml  { head :ok }
    end
  end
end
