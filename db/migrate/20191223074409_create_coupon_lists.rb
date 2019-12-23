class CreateCouponLists < ActiveRecord::Migration[5.2]
  def change
    create_table :coupon_lists do |t|
      t.references :card_list, foreign_key: true
      t.text :description, null: false
      t.date :expiration
      t.timestamps
    end
  end
end
