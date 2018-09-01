class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :atter
      t.string :title
      t.string :choice_first
      t.string :choice_second
      t.text :contents
      t.string :tag
      t.text :rule
      t.timestamps
    end
  end
end
