class CategoriesController < ApplicationController

  def index

    @parents = Category.where(parent_id: 0)
    # @ladis = @parents.find(1)
    # binding.pry

    # @categories = Category.eager_load(children: :children).where(parent_id: nil)

    # @categories = Category.where(parent_id: nil)

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
    # params idを使用してID取得 
    category.products
  end
end
