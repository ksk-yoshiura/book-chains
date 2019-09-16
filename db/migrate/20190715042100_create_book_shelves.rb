class CreateBookShelves < ActiveRecord::Migration[5.2]
  def up
    create_table :book_shelves do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
  def down
  end
end
