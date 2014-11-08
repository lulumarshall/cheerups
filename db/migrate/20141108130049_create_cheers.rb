class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.integer :user_id
      t.string :cheerup

      t.timestamps
    end
  end
end
