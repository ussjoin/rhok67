class HardwareType < ActiveRecord::Base
  has_many :sensors
end
