class Team < ActiveRecord::Base
  validates :hometown, :number_of_players, :presence:true
  validates_uniqueness_of :name
end
