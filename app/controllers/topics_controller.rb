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

  def explore
    if latest_search?
      @topics = Topic.where("description LIKE ?", "%#{params[:keyword]}%").order(created_at: "DESC")
    elsif account_search?
      @users = User.where("name LIKE ?", "%#{params[:keyword]}%").or(User.where("twitter_id LIKE ?", "%#{params[:keyword]}%"))
    elsif image_search?
      @topics = Topic.where("description LIKE ?", "%#{params[:keyword]}%").where.not(image: [nil, ''])
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

  def latest_search?
    params[:keyword].present? && params[:tabvalue] == "Latest"
  end

  def account_search?
    params[:keyword].present? && params[:tabvalue] == "Account"
  end

  def image_search?
    params[:keyword].present? && params[:tabvalue] == "Image"
  end
end