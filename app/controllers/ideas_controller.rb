class IdeasController < ApplicationController

	def index
		@ideas=Idea.paginate(page: params[:page], per_page: 20)
	end

	def show
		@idea=Idea.find(params[:id])
		@user=@idea.user
		@team=@idea.team
		if params[:name] != nil
      		team = Team.find_by(name: params[:name])
     		if @idea.team.blank?
        		idea.team_id=team.id
     		end
    	end 
	end

	def new 
		@idea= Idea.new
	end

	def create
		@idea= Idea.new(idea_params)
		if @idea.save
			flash[:success]="Idea Created"
			redirect_to @idea
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @idea.update_attributes(idea_params)
			flash[:success] = "Idea Updated"
			redirect_to @idea
		else
			render 'edit'
		end
	end

	def destroy
		Idea.find(params[:id]).destroy
		flash[:success] = "Idea Deleted"
		redirect_to ideas_url
	end

	private 

	def idea_params
		params.require(:idea).permit(:name, :user_id, :description)
	end
end
