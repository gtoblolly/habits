class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.string :title,     null:false
      t.string :content,   null:false
      t.timestamps
    end
  end
end
