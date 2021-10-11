class CommentsController < ApplicationController

  def create
    if Comment.new(comment_params).save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      redirect_to topics_path, danger: 'コメントの投稿に失敗しました'
    end
  end

  private

  def comment_params
    {
      user_id: current_user.id,
    }.merge(params.require(:comment).permit(:topic_id, :description))
  end
end
