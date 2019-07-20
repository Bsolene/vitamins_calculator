class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :activities
  end
end
