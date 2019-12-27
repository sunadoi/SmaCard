FactoryBot.define do
  
  factory :benefit_list do
    card_list
    description {"3ポイントで100円オフ"}

    after(:create) do |benefit_list|
      create(:benefit, benefit_list: benefit_list)
    end
  end
  
end