class ChatroomController < ApplicationController
    before_action :require_user
    #Helper method from Application controller



    def index 
    	@message = Message.new
    	@messages = Message.custom_display
    end
end