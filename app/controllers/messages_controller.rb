class MessagesController < ApplicationController
	before_action :require_user

	def create
		message = current_user.messages.build(message_params)
		#.build commands build the assocaition defined between user and messages.
		if message.save
			# redirect_to root_path
			ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
		end
	end

	private

	def message_params
		params.require(:message).permit(:body)
	end
    
    #this is how partials are given in controlleres. 
	def message_render(message)
		render(partial: 'message', locals: {message: message})
	end

end
