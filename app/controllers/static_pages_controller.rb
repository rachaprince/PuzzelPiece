class StaticPagesController < ApplicationController
  def home
  	@wallpost = User.find_by(params[:id]).wallposts.build if signed_in?
  	@user = current_user
  end

  def help
  end

  def about
  end

  def contact
  end 
end
