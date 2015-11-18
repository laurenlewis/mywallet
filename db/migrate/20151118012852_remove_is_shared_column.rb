class RemoveIsSharedColumn < ActiveRecord::Migration
  def change
  	remove_column :cards_users, :is_shared, :boolean
  end
end
