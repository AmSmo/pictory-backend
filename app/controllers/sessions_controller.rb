class SessionsController < ApplicationController
    def login
        debugger
        user = User.find_by(username: user_params[:username])
        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            render json: { status: 401 }
        end
    end

    def logout
        session.delete(:user_id)
        render json: { status: 401 }
    end 

    def user_params
        params.require(:session).permit(:username)
    end
end
