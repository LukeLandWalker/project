class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :cards, :type, :types
  end

  def down
  end
end
