class HomeController < ApplicationController

  def index
    @event = Event.first
    @talks = @event.talks.where('start_at >= ? or end_at >= ?', Time.now, Time.now) if @event
  end

end
