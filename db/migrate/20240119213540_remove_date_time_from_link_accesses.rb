class RemoveDateTimeFromLinkAccesses < ActiveRecord::Migration[7.1]
  def change
    remove_column :link_accesses, :date_time, :datetime
  end
end
