class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create!(params.require(:item).permit(:content, images:[])) # POINT
    if @item.save
      redirect_to new_item_path
    else
      render :new
    end
  end

  def show
    set_item
  end

  def edit
    set_item
  end

  def update
    if @item.user_id == current_user.id
      @item.update(item_params)
      flash[:notice] = "商品情報を編集しました"
      redirect_to item_confirmation_items_path(@item)
    else
      flash[:notice] = "権限がありません"
      redirect_to  edit_item_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

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
