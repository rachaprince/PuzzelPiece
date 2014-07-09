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
     			@idea.update(team_id: team.id)
        		redirect_to @idea
     		end
    	end 
	end

	def new 
		@idea= Idea.new
	end

	def create
		@idea= Idea.new(idea_params)
		if @idea.save
			Skill.count.times do |i|
        		unless params[:skill]==nil
        			if params[:skill][i.to_s] =='1'
              		@idea.requirements.create!(idea_id: @idea.id, skill_id: (i+1))
        			end
        		end
            end
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
			Skill.count.times do |i|
        		unless params[:skill]==nil
        			if params[:skill][i.to_s] =='1'
              		@idea.requirements.create!(idea_id: @idea
              			.id, skill_id: (i+1))
        			end
        		end
            end
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
