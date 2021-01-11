class HomesController < ApplicationController
  def index
    if user_signed_in?
      @studios = Studio.all
      rooms = current_user.rooms
      @studio_ids = []
      rooms.each do |r|
        @studio_ids << r.studio_id
      end

    elsif studio_signed_in?
      @users = User.all
      rooms = current_studio.rooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
end
