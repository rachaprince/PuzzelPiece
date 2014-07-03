class WallpostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @wall = Wall.find(params[:id]).wall
  	@wallpost = current_user.wallposts.build(wallpost_params)
  	if @wallpost.save
      create_post!(@wallpost)
  		flash[:success] = "Wallpost Created!"
  		redirect_back_or root_url
  	else
      @feed_items = []
  		render 'static_pages/home'
  	end 
  end

  def destroy
    @wallpost.destroy
    redirect_to root_url
  end

  private

  	def wallpost_params
  		params.require(:wallpost).permit(:content)
  	end 

    def correct_user
      @wallpost = current_user.wallposts.find_by(id: params[:id])
      redirect_to root_url if @wallpost.nil?
    end 
end
