class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			remember @user
			flash[:success] = "Sign up successful!"
      		redirect_to @user
		else
			render 'new'
		end
	end
	def show
		@user = User.find(params[:id])
		@team = Team.new
		@title = "Teams"
		@user  = User.find(params[:id])
		@teams = @user.teams
		@task_list = @user.task_lists.build
		@task_lists = @user.task_lists.load.reject(&:new_record?)
	end

	def teams
		@title = "My Teams"
		@user  = User.find(params[:id])
		@teams = @user.teams
    	render 'show_teams'
	end

	private
		def user_params
			params.require(:user).permit(:email, :name, :password, :password_confirmation)
		end

		def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_url) unless current_user?(@user)
	    end
end
