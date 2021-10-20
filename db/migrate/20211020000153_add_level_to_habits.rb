class AddLevelToHabits < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :level, :integer, default: 1
  end
end