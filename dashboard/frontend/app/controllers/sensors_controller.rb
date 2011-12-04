class SensorsController < ApplicationController
  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sensors }
    end
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
    @sensor = Sensor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sensor }
    end
  end
  
  # GET /sensors/datas
  # convention method to return all inputs for an array of sensords
  # JSON request should contain an array of sensor ids
  def inputs
    @inputs = Array.wrap(Input.find_by_sensor_id(params[:ids]))

    respond_to do |format|
      format.json { render :json => @inputs }
    end
  end

  # GET /sensors/new
  # GET /sensors/new.json
  def new
    @sensor = Sensor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sensor }
    end
  end

  # GET /sensors/1/edit
  def edit
    @sensor = Sensor.find(params[:id])
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @sensor = Sensor.new(params[:sensor])

    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, :notice => 'Sensor was successfully created.' }
        format.json { render :json => @sensor, :status => :created, :location => @sensor }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sensors/1
  # PUT /sensors/1.json
  def update
    @sensor = Sensor.find(params[:id])

    respond_to do |format|
      if @sensor.update_attributes(params[:sensor])
        format.html { redirect_to @sensor, :notice => 'Sensor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @sensor = Sensor.find(params[:id])
    @sensor.destroy

    respond_to do |format|
      format.html { redirect_to sensors_url }
      format.json { head :ok }
    end
  end
end
