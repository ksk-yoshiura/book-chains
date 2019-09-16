class Bookshelf < ActiveRecord::Migration[5.2]
  def change
    drop_table :book_shelves
  end
end
