class LocationPhoto < ApplicationRecord
  belongs_to :photo
  belongs_to :location
end
