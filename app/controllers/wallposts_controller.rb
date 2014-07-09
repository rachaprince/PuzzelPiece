class WallpostsController < ApplicationController

	def create
		@user = User.find(params[:wall_id])
		@wall = @user.wall
		@wallpost = @wall.wallposts.build(wallpost_params)
		if @wallpost.save
			flash[:success] = "Wallpost Created!"
			redirect_to @user
		else
			@wall_items = []
			redirect_to @user
		end 
	end 

	private
	def wallpost_params
		params.require(:wallpost).permit(:content, :user_id)
	end 

end
