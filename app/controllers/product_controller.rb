class ProductController < ApplicationController

  def index
    # サーバー 一覧表示, DBより最新の4件をトップページに表示
    @products = Product.order(created_at: :desc).limit(4)
  end

  def new
  end

  def create
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.order(created_at: :desc).limit(6)
    @other_user_products = Product.where(user_id: @product.user_id).order("id DESC").limit(6)
    @other_bland_products = Product.where(balnd_id: @product.bland_id).order("id DESC").limit(6)
  end

  def edit
  end

  def update
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  def users_product
    @product = Product.find(params[:id])
  end


end
