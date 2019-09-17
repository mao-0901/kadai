class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(content: params[:content])
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      redirect_to(root_path)
    else
      render(:new)
    end
  end
end
