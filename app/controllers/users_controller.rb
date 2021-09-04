class UsersController < ApplicationController
  before_action :authenticate_user!

  def show # マイページの表示
    @user = User.find(params[:id])
    @members = User.all 
    # @events = Event.where("start_at > ?", Time.zone.now).order(:start_at)
    @participations = Participation.page(params[:page]).per(3).where(user: current_user)

    respond_to do |format|
      format.html
      format.json
    end
  end
end
