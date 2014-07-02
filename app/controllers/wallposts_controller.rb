class WallpostsController < ApplicationController
  before_action :signed_in_user

  def create
  	@wallpost = current_user.wallposts.build(wallpost_params)
  	if @wallpost.save
  		flash[:success] = "Wallpost Created!"
  		redirect_back_or root_url
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
