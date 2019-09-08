class RemoveColumnChains < ActiveRecord::Migration[5.2]
  def change
    remove_column :chains, :likes_count, :integer
  end
end
