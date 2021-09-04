class ParticipationsController < ApplicationController
  def new
    raise ApplicationController::RoutingError, "ログイン状態で PartcipationController#new にアクセス"
  end

  def create
    event = Event.find(params[:event_id])
    @participation = current_user.participations.build do |p|
      p.event = event
      p.comment = params[:participation][:comment]
    end
    if @participation.save
      redirect_to event, notice: "このイベントに参加表明しました"
    end
  end  

  def destroy
    participation = current_user.participations.find_by!(event_id: params[:event_id])
    participation.destroy!
    redirect_to event_path(params[:event_id]), notice: "このイベントの参加をキャンセルしました"
  end
end
