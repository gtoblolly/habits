class AddExpToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :exp, :string
    add_column :records, :integer, :string
  end
end
