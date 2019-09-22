class ApplicationController < ActionController::Base
    #before_action :require_login

    private

    def require_login
        redirect_to root_path
    end
end
