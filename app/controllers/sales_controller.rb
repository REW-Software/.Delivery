class SalesController < ApplicationController
  before_action :authorizeAdmin, except: [:show]
  def index
    @sales = Sale.all
  end

  def show
    @post = Post.find(params[:post_id])
    @sale = Sale.find(params[:id])
    @products = @sale.products
  end

  def new
    @post = Post.find(params[:post_id])
    @sale = @post.sales.build
  end

  def create
    @post = Post.find(params[:post_id])
    @sale = @post.sales.create(sale_params)

    if @sale.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @sale = Sale.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      redirect_to sale_path(@sale, :post_id => @post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @sale = Sale.find(params[:id])
    @sale.destroy

    redirect_to post_path(@post)
  end

  private
  def sale_params
    params.require(:sale).permit(:payment_type, :name_client, :phone_client, :street, :number)
  end
end
