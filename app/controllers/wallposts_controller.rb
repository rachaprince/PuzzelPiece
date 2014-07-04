class WallpostsController < ApplicationController

	def create
		@user = User.find(params[:wall_id])
		@wall = @user.wall
		@wallpost = @wall.wallposts.build(wallpost_params)
		redirect_to @user
	end 

	private
	def wallpost_params
		params.require(:wallpost).permit(:content)
	end 

end
