class PostsController < ApplicationController
  before_action :authorizeAdmin

  def new
    @post = Post.new
    filter_delivery_man if params[:tipo]
  end

  def create
    @post = Post.new(delivery_params)
    filter_delivery_man if params[:tipo]

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

  def filter_delivery_man
    @user = @user.select do |u| 
      u.tipo.deliveryMan == params[:tipo]
    end
  end

  def delivery_params
    params.require(:delivery).permit(:sale_id, :user_id, :status)
  end
end