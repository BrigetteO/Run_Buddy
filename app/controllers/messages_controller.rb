class MessagesController < ApplicationController
  # before_action :set_recipient

  def new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.recipient_id = params[:recipient_id]

    respond_to do |format|
      if @message.save
        # UserMailer.notification_email(@message).deliver_later
        format.html { redirect_to @message, notice: 'Message sent!' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # def set_recipient
    #   @recipient = User.find(params[:recipient_id])
    # end

    def message_params
      params.require(:message).permit(:content, :recipient_id)
    end
end
