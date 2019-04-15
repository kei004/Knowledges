class RoomGroup < ApplicationRecord
  #after_create_commit { RoomGroupBroadcastJob.perform_later self }
  
  belongs_to :user
  belongs_to :room
end
