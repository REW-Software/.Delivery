class SalesController < ApplicationController
  before_action :authorize
  before_action :authorizeAdmin, except: [:show]
  def index
    @sales = Sale.all
  end

  def show
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:id])
    @products = @sale.products
    @client = User.find_by(email: @sale.name_client)
  end

  def new
    @post = Post.find(params[:post_id])
    @sale = @post.sales.build
    @clients = User.where("type_user = 'Cliente'")
  end

  def create
    @post = Post.find(params[:post_id])
    @sale = @post.sales.create(sale_params)
    @clients = User.where("type_user = 'Cliente'")

    if @sale.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @clients = User.where("type_user = 'Cliente'")
  end

  def update
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:id])

    if @sale.update(sale_params)
      redirect_to sale_path(@sale, :post_id => @post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @sale.destroy

    redirect_to post_path(@post)
  end

  private
  def sale_params
    params.require(:sale).permit(:payment_type, :name_client)
  end
end
