class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :text,       null:false
      t.references :habit,  forign_key: true
      t.timestamps
    end
  end
end
