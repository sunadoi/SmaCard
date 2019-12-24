class CreateCardLists < ActiveRecord::Migration[5.2]
  def change
    create_table :card_lists do |t|
      t.references :admin, foreign_key: true
      t.timestamps
    end
  end
end
