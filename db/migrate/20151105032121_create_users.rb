class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :phone, :limit => 10
      t.string :fname
      t.string :lname

      t.timestamps null: false
    end
  end
end
