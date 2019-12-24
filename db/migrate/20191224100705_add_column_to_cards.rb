class AddColumnToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :card_list_id, foreign_key: true
  end
end
