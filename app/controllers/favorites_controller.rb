class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to detail_topics_path(topic_id: params[:topic_id]), success: 'お気に入りに登録しました'
    else
      redirect_to detail_topics_path(topic_id: params[:topic_id]), danger: 'お気に入りに登録に失敗しました'
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])

    if favorite.present? && favorite.destroy
      redirect_to detail_topics_path(topic_id: params[:topic_id]), success: 'お気に入りに取り消しました'
    else
      redirect_to detail_topics_path(topic_id: params[:topic_id]), danger: 'お気に入りの取り消しに失敗しました'
    end
  end

end