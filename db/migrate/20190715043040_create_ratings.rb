class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :chain_id
      t.integer :rank2_id
      t.integer :rank3_id
      t.integer :rank4_id
      t.integer :rank5_id

      t.timestamps
    end
  end
end
