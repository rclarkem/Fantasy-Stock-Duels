class SessionsController < ApplicationController
    # skip_before_action :authorized, only: [:new, :create]

    def new
        
    end

    def create
        user = User.find_by_username(params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:errors] = ["Wrong username or password"]
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end
end
