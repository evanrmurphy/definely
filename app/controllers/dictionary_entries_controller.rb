class DictionaryEntriesController < ApplicationController
  # GET /dictionary_entries
  # GET /dictionary_entries.xml
  def index
    @dictionary_entries = DictionaryEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dictionary_entries }
    end
  end

  # GET /dictionary_entries/1
  # GET /dictionary_entries/1.xml
  def show
    @dictionary_entry = DictionaryEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dictionary_entry }
    end
  end

  # GET /dictionary_entries/new
  # GET /dictionary_entries/new.xml
  def new
    @dictionary_entry = DictionaryEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dictionary_entry }
    end
  end

  # GET /dictionary_entries/1/edit
  def edit
    @dictionary_entry = DictionaryEntry.find(params[:id])
  end

  # POST /dictionary_entries
  # POST /dictionary_entries.xml
  def create
    @dictionary_entry = DictionaryEntry.new(params[:dictionary_entry])

    respond_to do |format|
      if @dictionary_entry.save
        format.html { redirect_to(@dictionary_entry, :notice => 'Dictionary entry was successfully created.') }
        format.xml  { render :xml => @dictionary_entry, :status => :created, :location => @dictionary_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dictionary_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dictionary_entries/1
  # PUT /dictionary_entries/1.xml
  def update
    @dictionary_entry = DictionaryEntry.find(params[:id])

    respond_to do |format|
      if @dictionary_entry.update_attributes(params[:dictionary_entry])
        format.html { redirect_to(@dictionary_entry, :notice => 'Dictionary entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dictionary_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dictionary_entries/1
  # DELETE /dictionary_entries/1.xml
  def destroy
    @dictionary_entry = DictionaryEntry.find(params[:id])
    @dictionary_entry.destroy

    respond_to do |format|
      format.html { redirect_to(dictionary_entries_url) }
      format.xml  { head :ok }
    end
  end
end
