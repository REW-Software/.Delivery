class PostsController < ApplicationController
  before_action :authorizeAdmin

  def new
    @post = Post.new
    @sales = Sale.all
    @users = User.where("tipo = 'DeliveryMan'")
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:sale_id, :user_id, :status)
  end
end