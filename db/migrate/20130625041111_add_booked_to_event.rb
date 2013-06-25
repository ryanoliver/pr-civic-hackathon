class AddBookedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :Booked, :boolean
    add_column :events, :userID, :integer
  end
end
