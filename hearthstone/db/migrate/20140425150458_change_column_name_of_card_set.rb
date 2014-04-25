class ChangeColumnNameOfCardSet < ActiveRecord::Migration
  def change
    rename_column :card_sets, :describe, :description
  end

  def down
  end
end
