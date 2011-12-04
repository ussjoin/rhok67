class SensorBox < ActiveRecord::Base
  belongs_to :system
  has_many :sensors
end
