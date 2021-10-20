class AddLevelToHabits < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :level, :string
    add_column :habits, :integer, :string
  end
end
