class ProductController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :users_product]

  def index
    # サーバー 一覧表示, DBより最新の4件をトップページに表示
    @products = Product.order(created_at: :desc).limit(4)
  end

  def new
    @product = Product.new
    @product.build_delivery
  end

  def create
    @product = Product.create!(create_params)# POINT
    @product.images.attach(params[:product][:images])
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product
    @products = Product.order(created_at: :desc).limit(6)
    @other_user_products = Product.where(user_id: @product.user_id).order("id DESC").limit(6)
    @other_bland_products = Product.where(bland_id: @product.bland_id).order("id DESC").limit(6)
  end

  def edit
    @product
  end

  def update
    @product
    if @product.update(create_params)
      flash[:notice] = "商品情報を編集しました"
      redirect_to root_path
    else
      flash[:notice] = "編集できませんでした"
      render :edit
    end

  end

  def destroy
    product = Product.find(params[:id])
    if product.user_id == current_user.id
      product.destroy
      redirect_to '/listings'
    end
  end

  def users_product
    @product
  end

  def product_status
    # @items = current_user.items.order("created_at DESC")
    @products = current_user.products
  end

  def search
    @products_search = Product.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
  end

  private

  def set_item
    @product = Product.find(params[:id])
  end

  def create_params
    # images以外の値についてのストロングパラメータの設定
    params.require(:product).permit(:name,:text,:status,:price,:bland_id,delivery_attributes:[:id,:price,:region,:date,:product_id],category_attributes:[:id, :parent]).merge(user_id: current_user.id)
  end
  def image_params
    #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    params.require(:images).permit( {:images => []})
  end
end

