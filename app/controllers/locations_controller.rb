class LocationsController < ApplicationController
    def index
        locations = Location.page params[:page]
        pageCount = Location.page.total_pages
        if params[:page].blank?
            page = 1
            
        else
            page = params[:page]
        end

        render json: {places: ActiveModelSerializers::SerializableResource.new(locations), page_info: {current_page: params[:page], total_pages: page_count}}
    end

    def show
        location = Location.find_by(id: params[:id])
        render json: location
    end

    def create
        latitude = params[:latitude].to_f
        longitude = params[:longitude].to_f
        
        name = params[:name]
        newLocation = Location.create(name: name, latitude: latitude, longitude: longitude)
        LocationPhoto.create(photo_id: params[:photo_id].to_i, location: newLocation)
        if newLocation.valid?
            render json: newLocation
        else
            render json: {"boo": "hoo"}
        end
    end

    def search
        latitude = params[:latitude].to_f
        longitude = params[:longitude].to_f
        results = Location.grander_search(longitude, latitude)
        render json: results
    end
    private

    def location_params
        params.require(:location).permit(:name, :longitude, :latitude)
    end
end
