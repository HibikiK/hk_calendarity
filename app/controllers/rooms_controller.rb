class RoomsController < ApplicationController

  def index
    @user = current_user
    @members = User.all
    @posts = Post.page(params[:page]).per(5).order('created_at desc')
  end

  def show
    p = partner_params
    @members = User.all
    @partner = User.find(p[:id])
    @messages = (Message.where("user_id = ?", current_user.id).where("send_user_id = ?", @partner.id)).or(Message.where("user_id = ?", @partner.id).where("send_user_id = ?", current_user.id)).order('created_at desc')
  end

  protected
  def partner_params
    params.permit(:user_id, :id)
  end
end
