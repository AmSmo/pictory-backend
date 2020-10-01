class UserLocationsController < ApplicationController
    def create
        UserLocation.create(ul_params)
        location = Location.find_by(id: params[:location_id])
        
        render json: location
    end

    def unfollow
        
        ul = UserLocation.find_by(ul_params)
        ul.destroy
        location = Location.find_by(id: params[:location_id])
        render json: location
    end

    def my_locations
        
        user = User.find_by(id: params[:user_id])
        locations = user.locations
        render json: locations 
    end

    private

    def ul_params
        params.require(:user_location).permit(:user_id, :location_id)
    end
end
