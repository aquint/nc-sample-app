class MembershipsController < ApplicationController
  before_action :logged_in_user
  def create
    team = Team.find_by(id: params[:team_id])
    user = User.find_by(id: params[:user_id])
    user.join_team(team)
    redirect_to interface_show_path
  end

  def destroy
    team = Team.find_by(id: params[:team_id])
    user = User.find_by(id: params[:user_id])
    user.leave_team(team)
    redirect_to interface_show_path
  end
end
