require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  def setup
    @room = Room.new(atter:"1",title:"TEST", choice_first:"A",choice_second:"B",contents:"TEST",tag:"TEST",rule:"TEST")
    @user = User.first
  end

  test "associated messages should be destroy" do
    @room.save
    @room.messages.create!(content:"Test",user_id:@user.id)
    assert_difference 'Message.count',-1 do
      @room.destroy
    end
  end
end
