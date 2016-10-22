class ProfilesController < ApplicationController

  def show
    @tides = Tide.all
    @events = Event.all
    @user_events = UserEvent.all
    @user = User.find(params[:id])
  end
end
