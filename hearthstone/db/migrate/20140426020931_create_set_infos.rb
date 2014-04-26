class CreateSetInfos < ActiveRecord::Migration
  def change
    drop_table :set_infos
    create_table :set_infos do |t|
      t.string :set_name
      t.integer :card_id
      t.integer :number

      t.timestamps
    end
  end
end
