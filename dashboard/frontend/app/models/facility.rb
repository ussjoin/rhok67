class Facility < ActiveRecord::Base
  has_many :buildings
  belongs_to :company
end
