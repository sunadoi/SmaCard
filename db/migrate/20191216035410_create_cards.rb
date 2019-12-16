class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.bigint :admin_id, foreign_key: true
      t.bigint :user_id, foreign_key: true
      t.bigint :relatin_id, foreign_key: true
      t.integer :point, default: 0
      t.timestamps
    end
  end
end
