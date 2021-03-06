class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content

      t.timestamps
    end
    add_index :messages, [:user_id, :created_at]
  end
end
