class Booking < ActiveRecord::Base
  attr_accessible :bizId, :day, :service, :slot, :time, :userId
end
