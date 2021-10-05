class AddUserIdToHabits < ActiveRecord::Migration[6.0]
  def change
    add_reference :habits, :user, foreign_key: true
  end
end
