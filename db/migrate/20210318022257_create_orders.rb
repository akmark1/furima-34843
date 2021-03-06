class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string  :zip_code,     null:false
      t.integer :state_id,     null:false
      t.string  :city,         null:false
      t.string  :house_number, null:false
      t.string  :room_number
      t.string  :phone_number, null:false
      t.references :buy,       null:false, foreign_key:true
      t.timestamps
    end
  end
end
