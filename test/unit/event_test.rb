# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  color      :string(255)
#  start      :datetime
#  end        :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bisId      :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
