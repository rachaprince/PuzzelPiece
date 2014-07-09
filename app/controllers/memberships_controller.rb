class MembershipsController < ApplicationController
before_action :signed_in_user

  def create
  	@team = Team.find(params[:id])
    @user = current_user
    @team.join_team!(@user)
    respond_to do |format|
      format.html {redirect_to @team}
      format.js
      end   
  end

  def destroy
  	@user = current_user
    @team = Membership.find(params[:id]).team
    current_user.leave_team!(@team)
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end 
  end
end
