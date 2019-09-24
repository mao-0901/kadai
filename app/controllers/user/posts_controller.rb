class User::PostsController < ApplicationController
    #before_action :require_login, only[:index]
    def index
        #ポストのユーザーIDを取って、そのユーザーの投稿すべてをとってくる
        @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(25)
    end
end