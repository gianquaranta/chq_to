class CreateLinkAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :link_accesses do |t|
      t.datetime :date_time
      t.string :ip
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
