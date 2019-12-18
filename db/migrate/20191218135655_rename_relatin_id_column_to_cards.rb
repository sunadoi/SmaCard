class RenameRelatinIdColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :relatin_id, :relation_id
  end
end
