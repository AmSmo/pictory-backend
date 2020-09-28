# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string
#  longitude  :float
#  latitude   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
    has_many :location_photos, dependent: :destroy
    has_many :user_locations, dependent: :destroy
    has_many :photos, through: :location_photos
    has_many :users, through: :user_locations

    
end
