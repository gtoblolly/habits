class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :record

      t.timestamps
      t.index [:user_id, :record_id], unique: true
    end
  end
end
