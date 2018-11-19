class CreateRoomgreps < ActiveRecord::Migration[5.2]
  def change
    create_table :roomgreps do |t|
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
