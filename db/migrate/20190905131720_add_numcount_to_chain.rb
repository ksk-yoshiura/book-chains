class AddNumcountToChain < ActiveRecord::Migration[5.2]
  def change
    add_column :chains, :likes_count, :integer
  end
end
