class ChangeBalanceDefaultValue < ActiveRecord::Migration
  def change
  	change_column_default(:cards, :balance, 0)
  end
end
