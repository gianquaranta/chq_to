class AddPasswordDigestAndRemovePasswordToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :password_digest, :string
    remove_column :links, :password, :string
  end
end
