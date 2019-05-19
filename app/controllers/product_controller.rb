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
  end

  def edit
  end

  def update
  end

  def delete
  end


end
