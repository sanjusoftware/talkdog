class HomeController < ApplicationController

  def index
    @talks = Talk.where('start_at >= ? and end_at <= ?', Time.now, Date.today)
  end

end
