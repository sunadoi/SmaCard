class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.bigint :card_id, foreign_key: true
      t.text :description, null: false
      t.datetime :expiration
      t.datetime :used_date
      t.timestamps
    end
  end
end
