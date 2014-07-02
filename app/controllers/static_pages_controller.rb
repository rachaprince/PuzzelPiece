class StaticPagesController < ApplicationController
  def home
  	@wallpost = current_user.wallposts.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end 
end
