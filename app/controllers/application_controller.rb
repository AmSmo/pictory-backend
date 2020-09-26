class ApplicationController < ActionController::API

    def logged_in?
        if session[:user_id]
            return User.find(session[:user_id]) 
        else
            return false
        end
    end
end
