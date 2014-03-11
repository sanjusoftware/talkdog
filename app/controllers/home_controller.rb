class HomeController < ApplicationController

  def index
    @event = Event.first
    @talks = @event.talks.recent if @event
  end

end
