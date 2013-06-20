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
#  userId      :integer
#

class Business < ActiveRecord::Base
  belongs_to :user
  attr_accessible :Description, :Name, :Phone
end
