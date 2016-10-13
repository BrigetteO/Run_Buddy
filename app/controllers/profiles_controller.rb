class ProfilesController < ApplicationController
  def show
    @tides = Tide.all
    @conversations = Conversation.all
    @user = User.find(params[:id])
  end
end
