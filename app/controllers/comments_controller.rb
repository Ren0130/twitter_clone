class CommentsController < ApplicationController

  def create
    if Comment.new(comment_params).save
      redirect_to detail_topics_path(topic_id: comment_params[:topic_id]), success: 'コメントを投稿しました'
    else
      redirect_to detail_topics_path(topic_id: comment_params[:topic_id]), danger: 'コメントの投稿に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:topic_id, :description).merge(user_id: current_user.id)
  end
end
