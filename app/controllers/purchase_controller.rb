class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_product, only: [:index, :pay]

  def index
    @user = @product.user
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    if current_user.card.blank?
      redirect_to new_card_path and return
    end
    @product = Product.find(params[:product_id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @product.price,
    :customer => card.customer_id,
    :currency => 'jpy',
    )
    @product.update( user_id: current_user.id, sale: "sold_out")
    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
