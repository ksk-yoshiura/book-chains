class CreateChainBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :chain_books do |t|
      t.integer :chain_id
      t.integer :book_id

      t.timestamps
    end
  end
end
