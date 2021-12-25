class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def topics
    @user=User.find(params[:user_id])
    @currentUserEntry=current_user.entries
    @userEntry= @user.entries
    if @user.id != current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

end