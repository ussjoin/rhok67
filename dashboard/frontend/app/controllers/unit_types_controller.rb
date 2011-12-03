class UnitTypesController < ApplicationController
  # GET /unit_types
  # GET /unit_types.json
  def index
    @unit_types = UnitType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @unit_types }
    end
  end

  # GET /unit_types/1
  # GET /unit_types/1.json
  def show
    @unit_type = UnitType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @unit_type }
    end
  end

  # GET /unit_types/new
  # GET /unit_types/new.json
  def new
    @unit_type = UnitType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @unit_type }
    end
  end

  # GET /unit_types/1/edit
  def edit
    @unit_type = UnitType.find(params[:id])
  end

  # POST /unit_types
  # POST /unit_types.json
  def create
    @unit_type = UnitType.new(params[:unit_type])

    respond_to do |format|
      if @unit_type.save
        format.html { redirect_to @unit_type, :notice => 'Unit type was successfully created.' }
        format.json { render :json => @unit_type, :status => :created, :location => @unit_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @unit_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unit_types/1
  # PUT /unit_types/1.json
  def update
    @unit_type = UnitType.find(params[:id])

    respond_to do |format|
      if @unit_type.update_attributes(params[:unit_type])
        format.html { redirect_to @unit_type, :notice => 'Unit type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @unit_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_types/1
  # DELETE /unit_types/1.json
  def destroy
    @unit_type = UnitType.find(params[:id])
    @unit_type.destroy

    respond_to do |format|
      format.html { redirect_to unit_types_url }
      format.json { head :ok }
    end
  end
end
