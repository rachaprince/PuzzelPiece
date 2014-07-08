class TeamsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  #before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @teams = Team.paginate(page: params[:page])
  end 

  def show
  	@team = Team.find(params[:id])
    @users = @team.users
    @ideas= @team.ideas
    if params[:email] != nil
      user = User.find_by(email: params[:email])
      unless @team.users.include?(user)
        user.teams << @team
      end
    end 
    @bio = @team.bio
    @messageboard = @team.messageboard
    @message = @team.messageboard.messages.build
    @messages = @team.messageboard.messages.paginate(page: params[:page], per_page: 7)
  end

  def new
  	@team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = "Team Profile Updated"
      redirect_to @team
    else
      render 'edit'
    end
  end 

  def create
  	@team = Team.new(team_params)
  	if @team.save
      Messageboard.create(text: @team.name, team_id: @team.id)
      current_user.teams << @team
  		flash[:success] = "Team Successfully Created!"
  		redirect_to @team
  	else
  		render 'new'
  	end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted."
    redirect_to teams_url
  end

  private
  	def team_params
  		params.require(:team).permit(:name, :bio)
  	end 

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
