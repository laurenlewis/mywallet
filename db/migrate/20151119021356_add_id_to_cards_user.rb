class AddIdToCardsUser < ActiveRecord::Migration
  def change
    add_column :cards_users, :id, :primary_key
  end
end
