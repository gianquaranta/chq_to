class AddUserIdToLinks < ActiveRecord::Migration[7.1]
  def change
    add_reference :links, :user, null: false, foreign_key: true
  end
end
