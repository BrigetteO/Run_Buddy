class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @messages = @conversation.messages
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    unless current_user.has_joined?(conversation)
      @conversation.users << current_user
    end
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversations_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id)
    end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
