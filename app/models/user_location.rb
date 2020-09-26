# == Schema Information
#
# Table name: user_locations
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  location_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
end
