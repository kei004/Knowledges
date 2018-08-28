class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.integer :atter
      t.string :title
      t.text :contents
      t.string :tag
      t.text :rule

      t.timestamps
    end
  end
end
