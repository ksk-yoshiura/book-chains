class RemoveBook5IdFromChains < ActiveRecord::Migration[5.2]
  def change
    remove_column :chains, :book5_id, :string
  end
end
