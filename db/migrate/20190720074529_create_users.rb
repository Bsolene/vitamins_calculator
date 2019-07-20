class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :username, null: false
      t.float :height
      t.float :weight
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
