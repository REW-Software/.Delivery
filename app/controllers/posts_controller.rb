class PostsController < ApplicationController
  before_action :authorize
  before_action :authorizeAdmin, except: [:show, :edit, :update]

  def new
    @post = Post.new
    @users = User.where("type_user = 'DeliveryMan'")
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
    @deliveryMan = User.find(@post.user_id)
    @sales = @post.sales
    @postTime = @post.created_at - 10800
  end

  def edit
    @post = Post.find(params[:id])
    @users = User.where("type_user = 'DeliveryMan'")
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :status)
  end
end