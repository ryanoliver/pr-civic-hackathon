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

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
