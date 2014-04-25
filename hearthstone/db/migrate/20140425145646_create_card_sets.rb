class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.string :name
      t.text :describe

      t.timestamps
    end
  end
end
