class MessagesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @recipient = User.find(params[:recipient_id])
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

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

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message updated!' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message deleted!' }
      format.json { head :no_content }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :recipient_id, :user_id)
    end
end
