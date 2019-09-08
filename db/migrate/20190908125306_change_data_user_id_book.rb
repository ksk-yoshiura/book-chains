class ChangeDataUserIdBook < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :user_id, :integer, foreign_key: true
  end
end
