class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
      if @user 
        redirect_back_or_to(root_path, notice: 'ログインに成功しました')
      else
        flash[:notice] = 'ログインに失敗しました'
        render :new
      end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private
    def login_params
      params.require(:user).permit(:email, :password)
    end
end
