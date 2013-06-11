class AddUserIdToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :userId, :integer
  end
end
