class CreateCardsCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :cards_coupons do |t|
      t.references :card, foreign_key: true
      t.references :coupon, foreign_key: true
      t.timestamps
    end
  end
end
