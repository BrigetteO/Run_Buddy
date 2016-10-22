class EventsController < ApplicationController

  def index
    @events = Event.all.limit(2)
  end 
end 