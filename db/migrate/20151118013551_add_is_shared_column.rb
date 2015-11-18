class AddIsSharedColumn < ActiveRecord::Migration
  def change
    add_column :cards_users, :is_shared, :boolean, :default => false
  end
end
