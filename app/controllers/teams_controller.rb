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
  end

  def create
    @team = Team.new team_params
   
    @team.save
    redirect_to @team
  end

  def show
   @team = Team.find(params[:id])
  end 

  def update
    @team = Team.find(params[:id])
   
    if @Team.update(params[:id].permit(:name, :hometown))
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
  @team = Team.find(params[:id])
  @team.destroy
 
  redirect_to teams_path
  end

  private
  
  def team_params
    params.require(:team).permit(:name, :hometown)
  end

end