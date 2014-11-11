class TeamsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]

  def show
    @team = Team.find(params[:id])
    @title = "Members"
    @users = @team.users
  end
  def create
    @team = Team.new(team_params)
    if @team.save
      # Handle a successful save.
      flash[:success] = "Team Created!"
      redirect_to @team
    else
      flash[:error] = "Team already exists"
      redirect_to interface_show_path
    end
  end
  def index
    @teams = Team.all
  end
  private

    def team_params
      params.require(:team).permit(:name)
    end
end
