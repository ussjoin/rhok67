class System < ActiveRecord::Base
  has_many :sensor_boxes
  belongs_to :building
  belongs_to :system_type
end
