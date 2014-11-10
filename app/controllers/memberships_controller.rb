class MembershipsController < ApplicationController
  before_action :logged_in_user
  def create
    team = Team.find(params[:team_id])
    current_user.join_team(team)
    redirect_to team
  end

  def destroy
    user = Membership.find(params[:id])
    current_user.leave_team(user)
    redirect_to user
  end
end
