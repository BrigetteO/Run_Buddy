class ConversationsController < ApplicationController

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    @conversation = Conversation.create!(conversation_params)
    redirect_to conversation_messages_path(@conversation)
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
