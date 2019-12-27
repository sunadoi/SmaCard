FactoryBot.define do
  
  factory :coupon do
    coupon_list

    after(:create) do |coupon|
      temp_card = create(:card)
      create(:cards_coupon, card: temp_card, coupon: coupon)
    end
  end
  
end