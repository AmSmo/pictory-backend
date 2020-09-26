class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users
    end

    def show
        if logged_in?
            user = User.find_by(id: params[:id])
            render json: user
        else
            render json: users
        end   

    end

end
