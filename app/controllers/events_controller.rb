class EventsController < ApplicationController
  def new
    @event = current_user.created_events.build
  end
  
  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "イベントの作成が完了しました"
    end
  end

  def index # グループイベントの表示
    @user = current_user
    @events = Event.page(params[:page]).per(3).where("start_at > ?", Time.zone.now).order(:start_at)
    @posts = Post.page(params[:page]).per(5).order('created_at desc')
  end

  def show
    @event = Event.find(params[:id])
    @participation = current_user && current_user.participations.find_by(event: @event)
    @participations = @event.participations.includes(:user).order(:created_at)
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: '更新が完了しました'
    end
  end
  
  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy!
    redirect_to user_path(current_user.id), notice: "イベントを削除しました"
  end

  private
  
  def event_params
    params.require(:event).permit(
      :name, :place, :definition, :start_at, :end_at, :event_type, :audience, :comment, :image
    )
  end

end
