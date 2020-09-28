class LocationsController < ApplicationController
    def index
        locations = Location.all
        render json: locations
    end


    private

    def search_params

    end
end
