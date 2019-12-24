class ChangeColumnToRelation < ActiveRecord::Migration[5.2]
  def up
    change_column :relations, :card_list_id, :bigint, foreign_key: true
  end

  def down
    change_column :relations, :card_list_id, :bigint
  end
end
