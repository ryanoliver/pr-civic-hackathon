class AddBisIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :bisId, :integer
  end
end
