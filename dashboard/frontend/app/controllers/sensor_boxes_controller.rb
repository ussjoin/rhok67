class SensorBoxesController < ApplicationController
  # GET /sensor_boxes
  # GET /sensor_boxes.json
  def index
    @sensor_boxes = SensorBox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sensor_boxes }
    end
  end

  # GET /sensor_boxes/1
  # GET /sensor_boxes/1.json
  def show
    @sensor_box = SensorBox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sensor_box }
    end
  end

  # GET /sensor_boxes/new
  # GET /sensor_boxes/new.json
  def new
    @sensor_box = SensorBox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sensor_box }
    end
  end

  # GET /sensor_boxes/1/edit
  def edit
    @sensor_box = SensorBox.find(params[:id])
  end

  # POST /sensor_boxes
  # POST /sensor_boxes.json
  def create
    @sensor_box = SensorBox.new(params[:sensor_box])

    respond_to do |format|
      if @sensor_box.save
        format.html { redirect_to @sensor_box, :notice => 'Sensor box was successfully created.' }
        format.json { render :json => @sensor_box, :status => :created, :location => @sensor_box }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sensor_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sensor_boxes/1
  # PUT /sensor_boxes/1.json
  def update
    @sensor_box = SensorBox.find(params[:id])

    respond_to do |format|
      if @sensor_box.update_attributes(params[:sensor_box])
        format.html { redirect_to @sensor_box, :notice => 'Sensor box was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sensor_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sensor_boxes/1
  # DELETE /sensor_boxes/1.json
  def destroy
    @sensor_box = SensorBox.find(params[:id])
    @sensor_box.destroy

    respond_to do |format|
      format.html { redirect_to sensor_boxes_url }
      format.json { head :ok }
    end
  end
end
