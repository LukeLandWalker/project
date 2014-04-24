class CreateTempSets < ActiveRecord::Migration
  def change
    drop_table :temp_sets
    create_table :temp_sets do |t|
      t.integer :card_id
      t.integer :number

      t.timestamps
    end
  end
end
