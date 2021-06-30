class ProductsController < ApplicationController
  before_action :authorizeAdmin

  def edit
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @product = @sale.products.find(params[:id])
  end
  
  def index
    @products = Product.all
  end

  def new
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @product = @sale.products.build
  end

  def create
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @product = @sale.products.create(product_params)

    if @product.save
      redirect_to sale_path(@sale, :post_id => @post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @product = @sale.products.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @product = @sale.products.find(params[:id])

    if @product.update(product_params)
      redirect_to sale_path(@sale, :post_id => @post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @sale = @post.sales.find(params[:sale_id])
    @product = @sale.products.find(params[:id])

    @product.destroy

    redirect_to  sale_path(@sale, :post_id => @post.id)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :quantity_product)
  end
end
