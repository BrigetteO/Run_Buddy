class MessagesController < ApplicationController
  before_action :set_recipient
 
  def new
    @message = Message.new(recipient_id: params[:user_id])

  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.recipient_id = @recipient.id
    if @message.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end 

  private 
  def message_params
    params.require(:message).permit(:title, :content, :recipient_id)
  end

  def set_recipient
      @recipient = User.find params[:user_id] if params[:user_id].present?
  end
end