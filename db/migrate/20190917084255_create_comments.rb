class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.references :user, null: false

      t.timestamps
    end
    add_foreign_key :comments, :users
  end
end
