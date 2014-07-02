class WallpostsController < ApplicationController
  before_action :signed_in_user

  def create
    wallpost_params[:author] = current_user.id
  	@wallpost = User.find(params[:id]).wallposts.build(wallpost_params)
  	if @wallpost.save
  		flash[:success] = "Wallpost Created!"
  		redirect_to :back
  	else
  		render 'static_pages/home'
  	end 
  end

  def destroy
  end

  private

  	def wallpost_params
  		params.require(:wallpost).permit(:content)
  	end 

end
