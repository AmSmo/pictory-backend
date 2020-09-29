class LocationPhotosController < ApplicationController
    def create
        new_join = LocationPhoto.create(lp_params)
        byebug
        if new_join.valid?
            location = Location.find_by(id: lp_params[:location_id])
            render json: location
        else
            render json: {"boo": "hoo"}
        end
    end
    
    private

    def lp_params
        params.require(:location_photo).permit(:location_id, :photo_id)
    end
end
