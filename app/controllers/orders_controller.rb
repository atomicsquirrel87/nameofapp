class OrdersController < ApplicationController

  def index
    @orders = Order.includes(:product).all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @orders = Order.all
  end

  def new
  end

  def create
  end

  def destroy
  end

end
