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
      if @room.atter == 1 
        redirect_to discussion_path
      elsif @room.atter == 2
        redirect_to question_path 
      end
    else
      flash[:danger] = 'Invalid'
      redirect_to roomhome_path
    end
  end

  def discuss
    if logged_in?
      @user = current_user
      @room = Room.find(params[:id])
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

  private
    def room_params
      params.require(:room).permit(:atter, :title, :choice_first,:choice_second,:contents,:tag,:rule)
    end

end
