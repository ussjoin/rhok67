require 'csv'

class DashboardController < ApplicationController
  # GET /dashboard
  # GET /dashboard.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @companies }
    end
  end
  
    def export
    sensors = Sensor.find(:all)
    stream_csv do |csv|
      csv << ["id","name"]
      sensors.each do |u|
        csv << [u.id,u.name]
      end
    end
  end
  
  
  private
    def stream_csv
       filename = params[:action] + ".csv"    
	
       #this is required if you want this to work with IE		
       if request.env['HTTP_USER_AGENT'] =~ /msie/i
         headers['Pragma'] = 'public'
         headers["Content-type"] = "text/plain"
         headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
         headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
         headers['Expires'] = "0"
       else
         headers["Content-Type"] ||= 'text/csv'
         headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" 
       end
 
      render :text => Proc.new { |response, output|
        csv = CSV.new(output, :row_sep => "\r\n") 
        yield csv
      }
    end
  
end