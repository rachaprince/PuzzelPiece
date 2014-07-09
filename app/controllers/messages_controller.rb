class MessagesController < ApplicationController
	def create
		@team = Team.find(params[:messageboard_id])
		@messageboard = @team.messageboard
		@message = @team.messageboard.messages.build(message_params)
		if @message.save
			flash[:success] = "Message Created!"
			redirect_to @team
		else
			@messageboard_items = []
			redirect_to @team
		end 
	end 

	private
	def message_params
		params.require(:message).permit(:content, :user_id)
	end 
end
