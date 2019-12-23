class ChangeColumnToCoupon < ActiveRecord::Migration[5.2]
  def up
    change_column :coupons, :coupon_list_id, :bigint, foreign_key: true
  end

  def down
    change_column :coupons, :coupon_list_id, :bigint
  end
end
