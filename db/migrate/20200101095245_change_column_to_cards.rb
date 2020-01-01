class ChangeColumnToCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :card_list_id_id
  end
end
