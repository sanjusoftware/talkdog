class HomeController < ApplicationController

  def index
    @event = Event.first
    @talks = @event.talks.where('start_at >= ? or end_at >= ?', Date.today, Date.today).order('start_at asc') if @event
  end

end
