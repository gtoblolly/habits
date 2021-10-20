class AddExpSumToHabits < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :exp_sum, :integer, default: 0
  end
end
