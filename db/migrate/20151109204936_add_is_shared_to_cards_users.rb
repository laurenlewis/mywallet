class AddIsSharedToCardsUsers < ActiveRecord::Migration
  def change
    add_column :cards_users, :is_shared, :boolean
  end
end
