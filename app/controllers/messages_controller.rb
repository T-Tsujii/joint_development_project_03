class MessagesController < ApplicationController

   def new
        @message = Message.new
    end
    
    def create
        Message.create(message_parameter)
    end

    def index
        @messages = Message.all
    end

    def show 
        @message = Message.find(params[:id])
    end

    def destroy
        Message.find(params[:id]).destroy
    end

    def edit
        @message = Message.find(params[:id])
    end

    def update
        Message.find(params[:id]).update(message_parameter)
    end

    private

    def message_parameter
        params.require(:message).permit(:title, :content)
    end
end
