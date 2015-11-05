class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_number, :limit => 16
      t.string :card_type
      t.integer :expiration_month, :limit => 2
      t.integer :expiration_year, :limit => 4
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
