class AgregarUsernameAUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string, null: false
    add_index :users, :username
  end
end
