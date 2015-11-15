class ChangePhonetoString < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  t.remove :phone
	  t.string :phone
	end
  end
end
