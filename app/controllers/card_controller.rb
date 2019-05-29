class CardController < ApplicationController

  
    def index
    end

    def new
      @card = Card.new
      card = Card.where(@card.user_id == current_user.id)
    end

    def pay
      if current_user.card.present?
        redirect_to '/card'
        return
      end
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        if params['payjp-token'].blank?
          redirect_to action: "new"
        else
          customer = Payjp::Customer.create(
          description: '登録テスト', 
          email: current_user.email, 
          card: params['payjp-token'],
          metadata: {user_id: current_user.id}
          ) 
          @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
          if @card.save
            redirect_to action: '/card'
          else
            redirect_to action: "pay"
          end
        end
    end

    def delete
        @card = Card.new
        card = Card.where(@card.user_id == current_user.id).first
        if card.present?
          Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
          customer = Payjp::Customer.retrieve(card.customer_id)
          customer.delete
          card.delete
        end
          redirect_to action: "new"
    end
    
    def show 
        @card = Card.new
        card = Card.where(@card.user_id == current_user.id).first
        if card.blank?
          redirect_to action: "new" 
        else
          Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
          customer = Payjp::Customer.retrieve(card.customer_id)
          @default_card_information = customer.cards.retrieve(card.card_id)
        end
    end  
end
