# == Schema Information
#
# Table name: businesses
#
#  id          :integer          not null, primary key
#  Name        :string(255)
#  Phone       :string(255)
#  Description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  userId      :string(255)
#

require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
