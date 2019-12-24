class CreateBenefitLists < ActiveRecord::Migration[5.2]
  def change
    create_table :benefit_lists do |t|
      t.references :card_list, foreign_key: true
      t.text :description
      t.timestamps
    end
  end
end
