class MessageboardController < ApplicationController
	def create
		@messageboard = Messageboard.new(messageboard_params)
		@messageboard.save
		redirect_to @messageboard
	end

	private
		def messageboard_params
			params.require(:messageboard).permit(:text, :team_id)
		end
end
