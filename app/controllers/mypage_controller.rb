class MypageController < ApplicationController
  # skip_befor_action :authenticate

  def index
    @events = Event.where("start_at > ?", Time.zone.now).order(:start_at)
  end
end