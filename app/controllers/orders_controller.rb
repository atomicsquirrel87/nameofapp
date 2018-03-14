class OrdersController < ApplicationController
before_action :authenticate_user!

  def index
    @orders = Order.includes(:product).all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

end
