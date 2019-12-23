class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.references :coupon_list
      t.date :used_date
      t.timestamps
    end
  end
end
