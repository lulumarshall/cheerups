class CreatePromotes < ActiveRecord::Migration
  def change
    create_table :promotes do |t|
      t.integer :user_id
      t.integer :cheer_id
      t.string :status

      t.timestamps
    end
  end
end
