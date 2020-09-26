# == Schema Information
#
# Table name: location_photos
#
#  id          :bigint           not null, primary key
#  photo_id    :bigint           not null
#  location_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class LocationPhoto < ApplicationRecord
  belongs_to :photo
  belongs_to :location
end
