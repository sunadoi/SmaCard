class ChangeColumnToBenefit < ActiveRecord::Migration[5.2]
  def up
    change_column :benefits, :benefit_list_id, :bigint, foreign_key: true
  end

  def down
    change_column :benefits, :benefit_list_id, :bigint
  end
end
