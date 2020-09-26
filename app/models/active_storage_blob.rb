class ActiveStorageBlob < ApplicationRecord
  belongs_to :active_storage_attachment

  def longitude
    JSON.parse(self.metadata)["longitude"].round(4)
  end

  def latitude
    JSON.parse(self.metadata)["latitude"].round(4)
  end
end
