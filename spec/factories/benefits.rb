FactoryBot.define do
  
  factory :benefit do
    benefit_list

    after(:create) do |benefit|
      temp_card = create(:card)
      create(:cards_benefit, card: temp_card, benefit: benefit)
    end
  end
  
end