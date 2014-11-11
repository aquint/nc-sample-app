class TeamsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]

  def show
    @team = Team.find(params[:id])
    @title = "Members"
    @users = @team.users
    @tasks = @team.task_lists
  end
  def create
    @team = Team.new(team_params)
    if @team.save
      # Handle a successful save.
      flash[:success] = "Team Created!"
      redirect_to @team
    else
      render 'new'
    end
  end
  def index
    @teams = Team.paginate(:per_page => 5, :page => params[:page])
  end
  private

    def team_params
      params.require(:team).permit(:name)
    end
end
