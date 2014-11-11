class InterfaceController < ApplicationController
  def show
  	@team = Team.new
  	@teams = Team.paginate(:per_page => 5, :page => params[:page])
  	@users = User.paginate(:per_page => 5, :page => params[:page])
  end
  def join
  	@team = Team.find(params[:team_id])
  	@team_users = @team.users
  	@all_users = User.paginate(:per_page => 5, :page => params[:page])
  end
end
