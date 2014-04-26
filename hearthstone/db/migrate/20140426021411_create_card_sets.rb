class CreateCardSets < ActiveRecord::Migration
  def change
    drop_table :card_sets
    create_table :card_sets do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
