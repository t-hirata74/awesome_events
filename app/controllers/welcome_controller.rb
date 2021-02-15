class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @events = Event.where("start_ad > ?", Time.zone.now).order(:start_at)
  end
end
