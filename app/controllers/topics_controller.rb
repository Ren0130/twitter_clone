class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users).order(created_at: "DESC")
  end

  def new
    @topic = Topic.new
  end

  def detail
    @topic = Topic.find(params[:topic_id])
  end

  def explore_latest
    if params[:keyword].present?
      @topics = Topic.where("description LIKE ?", "%#{params[:keyword]}%").order(created_at: "DESC")
    else
      @topics =nil
    end
  end

  def explore_account
    if params[:keyword].present?
      @topics = Topic.where("description LIKE ?", "%#{params[:keyword]}%").order(created_at: "DESC")
    else
      @topics =nil
    end
  end

  def explore_image
    if params[:keyword].present?
      @topics = Topic.where("description LIKE ?", "%#{params[:keyword]}%").order(created_at: "DESC")
    else
      @topics =nil
    end
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      redirect_to topics_path, danger: '投稿に失敗しました'
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end