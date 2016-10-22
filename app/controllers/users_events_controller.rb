class UsersEventsController < ApplicationController
	
  def create
    @user_event = UserEvent.create(user_id: current_user.id, event_id: params[:event_id])
  end
end