class AddExpSumToHabits < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :exp_sum, :string
    add_column :habits, :integer, :string
  end
end
