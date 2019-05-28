class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(current_user.id)
    @product = Product.all
    @product_count = Product.where(user_id: current_user.id).count
  end

  def personal_info
  end

  def plofile
  end

  def new
  end

  def login
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def logout
  end
end
