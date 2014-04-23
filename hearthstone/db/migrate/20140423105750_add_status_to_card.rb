class AddStatusToCard < ActiveRecord::Migration
  def change
	add_column :cards, :route, :string
  end
end
