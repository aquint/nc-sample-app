class InterfaceController < ApplicationController
  def show
  	@team = Team.new
  	@teams = Team.all
  	@users = User.all
    @task_lists = TaskList.all
  end
  def join
  	@team = Team.find(params[:team_id])
  	@team_users = @team.users
  	@all_users = User.all
  end
end
