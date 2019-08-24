class CreateChains < ActiveRecord::Migration[5.2]
  def change
    create_table :chains do |t|
      t.integer :user_id
      t.integer :book1_id
      t.integer :book2_id
      t.integer :book3_id
      t.integer :book4_id
      t.integer :book5_id

      t.timestamps
    end
  end
end
