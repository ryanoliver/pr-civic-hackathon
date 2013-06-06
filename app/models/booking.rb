# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  bizId      :integer
#  userId     :integer
#  slot       :integer
#  service    :string(255)
#  day        :string(255)
#  time       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ActiveRecord::Base
  attr_accessible :bizId, :day, :service, :slot, :time, :userId

  belongs_to :business

  validates :bizId, :userId, :slot, :day, :time, presence: true

end
