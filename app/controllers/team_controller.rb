class TeamController < ApplicationController
  def teams
  end
  def create_team
  @team = Team.new
  @teams.save
end
end