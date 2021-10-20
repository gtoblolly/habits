class AddExpToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :exp, :integer, default: 1
  end
end
