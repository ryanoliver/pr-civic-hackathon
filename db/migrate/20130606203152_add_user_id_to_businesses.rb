class AddUserIdToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :userId, :string
  end
end
