class WallpostsController < ApplicationController

	def create
		@wall = Wall.find(params[:wall_id])
		@wallpost = @wall.wallposts.create(wallpost_params)
		redirect_to wall_path(@wall)
	end 

	private
	def wallpost_params
		params.require(:wallpost).permit(:content)
	end 

end
