class PostsController < ApplicationController
  #skip_before_action :require_login, only: [:index]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(25)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: 'ツイートを送信しました。'
    else
      render(:new)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, notice: 'ツイートを編集しました。'
    else 
      render(:edit)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path, notice: 'ツイートを削除しました。'
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end
