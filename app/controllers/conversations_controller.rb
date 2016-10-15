class ConversationsController < ApplicationController
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
  end


  # def create
  #   recipients = User.where(id: conversation_params[:recipients])
  #   conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
  #   flash[:notice] = "Your message was successfully sent!"
  #   redirect_to conversation_path(conversation)
  # end

  # def show
  #   @receipts = conversation.receipts_for(current_user).order("created_at ASC")
  #   # mark conversation as read
  #   conversation.mark_as_read(current_user)
  # end

def reply
  current_user.reply_to_conversation(@conversation, params[:body])
  flash[:success] = 'Reply sent'
  redirect_to conversation_path(@conversation)
end


  # def trash
  #   conversation.move_to_trash(current_user)
  #   redirect_to mailbox_inbox_path
  # end

  # def untrash
  #   conversation.untrash(current_user)
  #   redirect_to mailbox_inbox_path
  # end

  private
  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  # def conversation_params
  #   params.require(:conversation).permit(:subject, :body, recipients:[])
  # end

  # def message_params
  #   params.require(:message).permit(:body, :subject)
  # end
end
