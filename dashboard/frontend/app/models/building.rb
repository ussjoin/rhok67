class Building < ActiveRecord::Base
  belongs_to :facility
  has_many :systems
end
