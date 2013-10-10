class Team < ActiveRecord::Base
  validates :hometown, :presence => true
  validates_uniqueness_of :name
end
