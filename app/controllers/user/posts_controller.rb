class User::PostsController < ApplicationController
    #before_action :require_login, only[:index]
    def index
        @posts = Post.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(25)
    end
end