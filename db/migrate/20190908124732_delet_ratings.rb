class DeletRatings < ActiveRecord::Migration[5.2]
  def change
    drop_table :ratings
  end
end
