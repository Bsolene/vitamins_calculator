class CreateActivityNutrients < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_nutrients do |t|
      t.references :activity, index: true, foreign_key: true
      t.references :nutrient, index: true, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end

  def down
    drop_table :activity_nutrients
  end
end
