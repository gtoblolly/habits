class AddUserIdToRecords < ActiveRecord::Migration[6.0]
  def change
    add_reference :records, :user, foreign_key: true
  end
end
