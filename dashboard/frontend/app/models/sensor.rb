class Sensor < ActiveRecord::Base
  has_many :inputs
  belongs_to :sensor_box
  belongs_to :hardware_type
  belongs_to :unit_type
  def as_json(options={})
    super(:include =>[:unit_type])
  end
end
