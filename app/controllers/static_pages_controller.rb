class StaticPagesController < ApplicationController
  def home
  	if signed_in?
   		@micropost = current_user.microposts.build
   		@feed_items = current_user.feed.paginate(page: params[:page], per_page: 7 )
      @teams = current_user.teams
      @ideas = current_user.ideas
   	end
  end

  def help
  end

  def about
  end

  def contact
  end
end
