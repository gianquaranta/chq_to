class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :slug, null: false
      t.string :url, null: false
      t.string :name
      t.string :type, null: false
      t.string :password
      t.datetime :expiration_date
      t.boolean :accessed

      t.timestamps
    end
  end
end
