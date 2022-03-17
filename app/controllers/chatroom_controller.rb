class ChatroomController < ApplicationController
    before_action :require_user
    #Helper method from Application controller



    def index 
    	@messages = Message.all
    end
end