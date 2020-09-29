class LocationsController < ApplicationController
    def index
        locations = Location.last(30)
        render json: locations
    end

    def create
        newLocation = Location.create(location_params)
        
        byebug
    end

    private

    def location_params
        params.require(:location).permit(:name, :longitude, :latitude)
    end
end
