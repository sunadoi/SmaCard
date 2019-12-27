FactoryBot.define do
  
  factory :coupon_list do
    card_list
    description {"3ポイントで100円オフ"}
    expiration  {"2019-12-31"}

    after(:create) do |coupon_list|
      create(:coupon, coupon_list: coupon_list)
    end
  end
  
end