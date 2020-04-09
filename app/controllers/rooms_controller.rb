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
    
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      flash[:danger] = 'Invalid'
      redirect_to roomhome_path
    end
  end

  def discuss
    @rooms = Room.all
  end

  def show 
    if logged_in?
      @room = Room.find(params[:id])
      @messages = @room.messages
      if RoomGroup.exists?(user_id:current_user.id,room_id:@room.id)
        @users = @room.users
      else  
        RoomGroup.create(user_id: current_user.id,room_id:@room.id )
        @users = @room.users
      end
    end
  end

  private
    def room_params
      params.require(:room).permit(:atter, :title, :choice_first,:choice_second,:contents,:tag,:rule)
    end

end
