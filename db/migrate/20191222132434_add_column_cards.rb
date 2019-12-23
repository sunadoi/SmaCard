class AddColumnCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :expiration, :date
    add_column :cards, :image, :text
  end
end