class Business < ActiveRecord::Base
  belongs_to :user
  attr_accessible :Description, :Name, :Phone
end
