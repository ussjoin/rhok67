class SystemsController < ApplicationController
  # GET /systems
  # GET /systems.json
  def index
    @systems = System.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @systems }
    end
  end

  # GET /systems/1
  # GET /systems/1.json
  def show
    @system = System.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @system }
    end
  end
  
  # GET /systems/1/sensors.json
  def sensors
    sensor_box_ids = SensorBox.find_by_system_id(params[:id], :select => 'id') 
    @sensors = System.find(sensor_box_ids)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sensors }
    end
  end

  # GET /systems/new
  # GET /systems/new.json
  def new
    @system = System.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @system }
    end
  end

  # GET /systems/1/edit
  def edit
    @system = System.find(params[:id])
  end

  # POST /systems
  # POST /systems.json
  def create
    @system = System.new(params[:system])

    respond_to do |format|
      if @system.save
        format.html { redirect_to @system, :notice => 'System was successfully created.' }
        format.json { render :json => @system, :status => :created, :location => @system }
      else
        format.html { render :action => "new" }
        format.json { render :json => @system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /systems/1
  # PUT /systems/1.json
  def update
    @system = System.find(params[:id])

    respond_to do |format|
      if @system.update_attributes(params[:system])
        format.html { redirect_to @system, :notice => 'System was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /systems/1
  # DELETE /systems/1.json
  def destroy
    @system = System.find(params[:id])
    @system.destroy

    respond_to do |format|
      format.html { redirect_to systems_url }
      format.json { head :ok }
    end
  end
end
