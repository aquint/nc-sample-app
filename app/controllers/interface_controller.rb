class InterfaceController < ApplicationController
  before_action :logged_in_user
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
