class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user.id != current_user.id
        redirect_to '/'
      else
        @studio = @room.studio
      end
    elsif studio_signed_in?
      if @room.studio.id == current_studio.id
        @user = @room.user
      else
        redirect_to '/'
      end

    else
      redirect_to '/'
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_studio_params)
      @room.user_id = current_user.id
    elsif studio_signed_in?
      @room = Room.new(room_user_params)
      @room.studio_id = current_studio.id
    else
      redirect_to '/'
    end

    if @room.save
      redirect_to action: 'show', id: @room.id
    else
      redirect_to '/'
    end
  end

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

  private
  def room_studio_params
    params.require(:room).permit(:studio_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end