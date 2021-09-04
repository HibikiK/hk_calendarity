class MessagesController < ApplicationController
  def create
    p = message_params
    user = User.find(p[:user_id])
    send_to = p[:send_user_id]
    if (p[:content] == '')
      flash[:alert] = 'メッセージを入力してください。'
    else
      if user.messages.create(content: p[:content], send_user_id: p[:send_user_id])
        flash[:notice] = 'メッセージが送信されました。'
      else
        flash[:alert] = 'メッセージの送信に失敗しました。'
      end
    end


    puts "#" * 30
    puts "#{p[:send_user_id]}"
    puts "send_to #{send_to}"
    puts "#" * 30

    redirect_to user_room_path(user_id: current_user.id ,id: p[:send_user_id])
  end

  protected
  def message_params
    params.require(:message).permit(:user_id, :content, :send_user_id) 
  end
end
