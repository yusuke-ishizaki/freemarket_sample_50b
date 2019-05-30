class CategoriesController < ApplicationController

  def index

    @parents = Category.where(parent_id: 0)

    # @parents = Category.find(params[:id])

    # @child = Category.where(parent_id: 1)
    

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
    # 一覧には際最新の20件が表示されるようにする記述
    # @products = Product.all.order(created_at: :desc).limit(20)

    # children = Category.where(parent_id: 1)
    @category = Category.find(params[:id])
    @products = Product.order(created_at: :desc).where(category_id: @category.id).limit(20)
    binding.pry

    # @products = Product.order(created_at: :desc).where(params[:category_id]).limit(20)


    # params idを使用してID取得
    # category.products

    # @child = Category.where(parent_id: 1)

    # @category = Category.find(1)
    # @category = Category.select('name')
    # @category_children_name = Category.select()
  end
end
