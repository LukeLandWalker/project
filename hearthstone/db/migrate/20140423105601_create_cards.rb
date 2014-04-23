class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :belong
      t.string :type
      t.integer :cost

      t.timestamps
    end
  end
end
