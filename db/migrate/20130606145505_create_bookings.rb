class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :bizId
      t.integer :userId
      t.integer :slot
      t.string :service
      t.string :day
      t.string :time

      t.timestamps
    end
  end
end
