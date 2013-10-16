class TeamsController < ApplicationController
 before_filter :authenticate_user!

  def index
    @teams = Team.all
    respond_to do |format|
      format.html
      format.json { render json: @teams }
      format.xml { render xml: @teams }
    end
  end

  def new
    @team = Team.new
    @team.refresh_teams
  end

  def create
    @team = Team.new team_params
   
    # require 'nokogiri'
    # require 'open-uri'
    # url = "http://www.nba.com/standings/team_record_comparison/conferenceNew_Std_Cnf.html"
    # doc = Nokogiri::HTML(open(url))
    # doc.css("tr.title:has(td:contains('Western')) ~tr").each do |team|
    #   p team.search('td')[0].text
    # end

    @team.save
    flash[:alert] = "New team created"
    redirect_to teams_path
  end

  def show
   @team = Team.find(params[:id])
  end 

  def edit
  @team = Team.find(params[:id])

  end

  def update
    team = Team.find(params[:id])
   
    if team.update(params[:team].permit(:name, :hometown))
      redirect_to teams_path
      flash[:alert] = "Team edited"
    else
      render 'edit'
    end
  end

  def destroy
  @team = Team.find(params[:id])
  @team.destroy
  flash[:alert] = "Team Destroyed"
 
  redirect_to teams_path
  end

  def remove_all
    Team.destroy_all
    flash[:alert] = "All Teams destroyed"
    redirect_to teams_path
  end

  private
  
  def team_params
    params.require(:team).permit(:name, :hometown)
  end

end
