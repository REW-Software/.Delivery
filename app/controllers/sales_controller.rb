class SalesController < ApplicationController
  before_action :authorize
  before_action :authorizeAdmin, except: [:show]

  def show
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:id])
    @products = @sale.products
    @client = User.find_by(email: @sale.client_name)
    @total_price = total_price(@products)
  end

  def new
    @post = Post.find(params[:post_id])
    @sale = @post.sales.build
    @clients = User.where("user_type = 'Cliente'")
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
    @sale = @post.sales.find(params[:id])
    @clients = User.where("user_type = 'Cliente'")
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
    @sale = @post.sales.find(params[:id])
    @sale.destroy

    redirect_to post_path(@post)
  end

  private
  def sale_params
    params.require(:sale).permit(:payment_type, :client_name)
  end

  def total_price(products)
    total = 0
    products.each do |product|
      total += (product.price - product.discount ) * product.product_quantity
    end
    return total
  end
end
