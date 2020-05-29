class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
   @favorites = current_user.liked_microposts.page(params[:page])
  end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = '投稿にいいねをしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
