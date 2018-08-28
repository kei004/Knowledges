class RoomsController < ApplicationController
  

  def home
  end

  def table
    @rooms = Room.all
  end

  def qa
  end

  def note
  end

  def new
    Room.create()
    redirect_to roomhome_path
  end

  def discuss
    if logged_in?
      @room = current_user
      @messages = @room.messages
    end
  end

  def show 
    if logged_in?
      @user = current_user
      @room = Room.find(params[:id])
      @messages = @room.messages
    end
  end


end
