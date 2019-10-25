class ApplicationController < ActionController::Base
    before_action :set_current_user
    # before_action :authorized

    # n = News.new("api_key")


    private

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    # def authorized
    #     if @current_user == nil
    #         redirect_to login_path
    #     end
    # end
end
