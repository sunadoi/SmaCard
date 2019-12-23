class CreateCardsBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :cards_benefits do |t|
      t.references :card, foreign_key: true
      t.references :benefit, foreign_key: true
      t.timestamps
    end
  end
end
