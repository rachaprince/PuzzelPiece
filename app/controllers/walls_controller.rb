class WallsController < ApplicationController

	def new
	end 
	
	def create
		@wall = Wall.new(wall_params)
		@wall.save
		redirect_to @wall
	end 

	def show
		@wall = Wall.find(params[:id])
		@wallpost = @wall.wallposts.build
	end 

	def index
		@walls = Wall.all 
	end 

	private
		def wall_params
			params.require(:wall).permit(:name, :description, :user_id)
		end 
end
