class UsersController < ApplicationController
	def show
		# @user = User.find(params[:id])
		@user = User.find_by_username(params[:username])
		unless @user
			# this is suboptimal, should probably go to users#index with a message "invalid user!" or just a blank page with "invalid user!"
			render "home/index"
		end
	end
end