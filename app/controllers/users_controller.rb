class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @team = Team.find(@user.favourite_team)
    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
end