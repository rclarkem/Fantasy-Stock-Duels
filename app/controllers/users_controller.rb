class UsersController < ApplicationController
    before_action :get_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all
    end

    def show
        @battle = Battle.new
    end

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
    
    end

    def update
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def get_user
        @user = User.find(params[:id])        
    end

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :wealth, :about_me, :photo_url)
    end
end
