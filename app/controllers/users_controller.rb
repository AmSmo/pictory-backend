class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users
    end

    def create
        login = User.find_by(username: params[:username])
        if login.present?
            render json: {username: login.username, user_id: login.id, message: "Welcome back #{login.username}"}
        else
            login = User.create(username: params[:username])
            render json: {username: login.username, user_id: login.id, message: "Welcome to the Pictory Community #{login.username}"}
        end
    end

end
