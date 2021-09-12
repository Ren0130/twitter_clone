class RootsController < ApplicationController
  def index
    if user_signed_in?
      redirect_to topics_path
      return
    end
  end
end
