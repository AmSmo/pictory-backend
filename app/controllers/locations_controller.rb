class LocationsController < ApplicationController
    def index
        locations = Location.all
        render json: locations
    end

    def search
        Location.where('latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ?', 
            (Location.last.latitude - 0.0015), 
            (Location.last.latitude + 0.0015),
            (Location.last.longitude - 0.0015), 
            (Location.last.longitude + 0.0015),
        )
    end
end
