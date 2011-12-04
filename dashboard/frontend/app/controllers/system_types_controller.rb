class SystemTypesController < ApplicationController
  # GET /system_types
  # GET /system_types.json
  def index
    @system_types = SystemType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @system_types }
    end
  end

  # GET /system_types/1
  # GET /system_types/1.json
  def show
    @system_type = SystemType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @system_type }
    end
  end

  # GET /system_types/new
  # GET /system_types/new.json
  def new
    @system_type = SystemType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @system_type }
    end
  end

  # GET /system_types/1/edit
  def edit
    @system_type = SystemType.find(params[:id])
  end

  # POST /system_types
  # POST /system_types.json
  def create
    @system_type = SystemType.new(params[:system_type])

    respond_to do |format|
      if @system_type.save
        format.html { redirect_to @system_type, :notice => 'System type was successfully created.' }
        format.json { render :json => @system_type, :status => :created, :location => @system_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @system_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /system_types/1
  # PUT /system_types/1.json
  def update
    @system_type = SystemType.find(params[:id])

    respond_to do |format|
      if @system_type.update_attributes(params[:system_type])
        format.html { redirect_to @system_type, :notice => 'System type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @system_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /system_types/1
  # DELETE /system_types/1.json
  def destroy
    @system_type = SystemType.find(params[:id])
    @system_type.destroy

    respond_to do |format|
      format.html { redirect_to system_types_url }
      format.json { head :ok }
    end
  end
end
