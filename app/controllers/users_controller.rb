class UsersController < ApplicationController
  def topics
    @user = User.find(params[:user_id])
  end
end