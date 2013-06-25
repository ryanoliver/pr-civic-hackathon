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
#  Booked     :boolean
#  userID     :integer
#

class Event < ActiveRecord::Base
  attr_accessible :color, :end, :start, :title, :bisId
end
