class BrandsController < ApplicationController
    def index
        @brand = Bland.all
    end

    def show
        @brand = Bland.find(params[:id])
        @products = Product.order(created_at: :desc).where(bland_id: @brand.id).limit(20)
    end

end
