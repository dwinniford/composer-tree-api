class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.boolean :starred, default: false
      t.integer :parent_note_id
      t.integer :user_id
      t.integer :tree_id

      t.timestamps
    end
  end
end
