class AddFuriganaToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :furigana, :string
  end
end
