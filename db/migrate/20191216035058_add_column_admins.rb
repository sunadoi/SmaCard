class AddColumnAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :relation_id, :bigint
  end
end
