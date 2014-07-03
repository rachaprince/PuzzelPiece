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
	end 

	def index
		@walls = Wall.all 
	end 

	private
		def wall_params
			params.require(:wall).permit(:name, :description)
		end 
end
