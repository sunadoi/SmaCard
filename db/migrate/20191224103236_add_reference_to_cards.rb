class AddReferenceToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :card_list, foreign_key: true
  end
end
