class CreateBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :benefits do |t|
      t.references :benefit_list
      t.date :used_date
      t.timestamps
    end
  end
end
