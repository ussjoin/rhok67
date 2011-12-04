class UploadController < ApplicationController
  require 'csv'
  require 'date'
  def upload
    uploaded_io = params[:csv]
    unless uploaded_io.nil?
      arr_of_arrs = CSV.parse(uploaded_io.read)
    
      #Skip Line 0
      #Line 1, 2, 3: Concatenate into labels
      arr_of_arrs.delete_at(0)
      
      params[:facility].strip!
      params[:building].strip!
      params[:systype].strip!
      params[:system].strip!
      
      #Company is A
      company = Company.find_or_create_by_name("A")
      #Get Facility from User
      facility = Facility.find_or_create_by_name_and_company_id(params[:facility], company.id)
      
      #Get Building from User
      building = Building.find_or_create_by_name_and_facility_id(params[:building], facility.id)
      
      #Get System Type from User
      systype = SystemType.find_or_create_by_name(params[:systype])
      
      #Get System from User
      system = System.find_or_create_by_name_and_system_type_id_and_building_id(params[:system],
        systype.id, building.id)
      
      #Here's a terrible assumption (FIXME): Sensor boxes should increase on every import,
      #Because we have absolutely no idea what they really are.
      sensorbox = SensorBox.new(:name => 'aBox', :serial => 'cereal', :system => system)
      
      arr_of_arrs[0].delete_at(0)
      arr_of_arrs[1].delete_at(0)
      arr_of_arrs[2].delete_at(0)
      
      #Hardware types is [0]
      hardwaretypes = arr_of_arrs[0].collect {|h|
        hw = HardwareType.find_or_create_by_name(h)
      }
      
      #Unit Types is [2]-- do an "insert if not extant"
      unittypes = arr_of_arrs[2].collect {|u|        
        unit = UnitType.find_or_create_by_name(u)
      }
      
      sensors = []
      arr_of_arrs[1].each_index {|i|
        s = arr_of_arrs[1][i]
        sens = Sensor.find_or_create_by_name_and_sensor_box_id_and_hardware_type_id_and_unit_type_id(
          s, sensorbox.id, hardwaretypes[i].id, unittypes[i].id
        )
        sensors.push(sens)
        }
      
      
      # arr_of_arrs[0].each_index {|i| arr_of_arrs[0][i] += " #{arr_of_arrs[1][i]} #{arr_of_arrs[2][i]}"}
      @headers = arr_of_arrs.delete_at(0)
      arr_of_arrs.delete_at(0)
      arr_of_arrs.delete_at(0)
      #       @main = arr_of_arrs[1..10]
      
      
      arr_of_arrs.each {|arr|
        #0 is date
        d = DateTime.parse(arr[0])
        arr.delete_at(0)
        arr.each_index {|i|
          s = Input.new(:sensor_id => sensors[i].id, :when => d, :value => arr[i])
          s.save
        }
      }
      
    end
  end
end
