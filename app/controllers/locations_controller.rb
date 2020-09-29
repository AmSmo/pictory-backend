class LocationsController < ApplicationController
    def index
        locations = Location.last(30)
        render json: locations
    end

    def create
        newLocation = Location.create(location_params)
        LocationPhoto.create(photo_id: params[:photo_id].to_i, location: newLocation)
        if newLocation.valid?
            render json: newLocation
        else
            render json: {"boo": "hoo"}
        end
    end

    private

    def location_params
        params.require(:location).permit(:name, :longitude, :latitude)
    end
end
