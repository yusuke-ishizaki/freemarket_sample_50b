class CategoriesController < ApplicationController

  def index

    @parents = Category.where(parent_id: 0)

    # 以下はメモです
    # @category = Category.find(1)
    # # 下記でレディースに紐付く子カテゴリーであるトップス、パンツ、靴を全て取得出来る
    # @category.children
    # ----------------------------
    # @category = Category.find(2)
    # # 下記でトップスに紐付く子カテゴリーであるTシャツ、セーター、パーカーを全て取得出来る
    # @category.children
    # # 下記でトップスの親カテゴリーであるレディースのカテゴリーを取得出来る
    # @category.parent
    # ----------------------------
    # @category = Category.find(5)
    # # 下記でTシャツの親カテゴリーであるトップスのカテゴリーを取得出来る
    # @category.parent
    # # 下記でTシャツの親の親のカテゴリーであるレディースのカテゴリーを取得出来る
    # @category.parent.parent

  end

  def show
    @category = Category.find(params[:id])
    @products = Product.order(created_at: :desc).where(category_id: @category.id).limit(20)
  end
end
