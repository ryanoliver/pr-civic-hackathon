class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :Name
      t.string :Phone
      t.string :Description

      t.timestamps
    end
  end
end
