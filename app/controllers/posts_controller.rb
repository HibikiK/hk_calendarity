class PostsController < ApplicationController
  def create
    p = post_params
    user = User.find(p[:id])
    if (p[:body] == '')
      flash[:alert] = 'Null comment is not permitted.'
    else
      if user.posts.create(body: p[:body], submitter: current_user.id)
        flash[:notice] = '投稿が送信されました。'
      else
        flash[:alert] = '投稿の送信に失敗しました。'
      end
    end

    user_rooms_path(user.id)
  end

  protected
  def post_params
    params.require(:post).permit(:body, :id)
  end
end
