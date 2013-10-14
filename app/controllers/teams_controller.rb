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
  end

  def create
    @team = Team.new team_params
   
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
