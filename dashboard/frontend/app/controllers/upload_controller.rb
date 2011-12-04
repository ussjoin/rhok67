class UploadController < ApplicationController
  require 'csv'
  def upload
    uploaded_io = params[:csv]
    unless uploaded_io.nil?
      arr_of_arrs = CSV.parse(uploaded_io.read)
    
      #Skip Line 0
      #Line 1, 2, 3: Concatenate into labels
      arr_of_arrs.delete_at(0)
      arr_of_arrs[0].each_index {|i| arr_of_arrs[0][i] += " #{arr_of_arrs[1][i]} #{arr_of_arrs[2][i]}"}
      @headers = arr_of_arrs.delete_at(0)
      arr_of_arrs.delete_at(0)
      arr_of_arrs.delete_at(0)
      @main = arr_of_arrs[1..10]
    end
  end
end
