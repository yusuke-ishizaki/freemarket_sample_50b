class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create!(params.require(:item).permit(:content, images:[])) # POINT
    redirect_to new_item_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update params.require(:item).permit(:content, :images) # POINT
    redirect_to @item
  end

  private
  def create_params
    # images以外の値についてのストロングパラメータの設定
    item_params = params.require(:item).permit(:content)
    return item_params
  end
  def image_params
    #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    params.require(:item).permit( {:user_ids => []})
  end

end
