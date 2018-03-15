class OrdersController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource

  def index
    @orders = Order.accessible_by(current_ability)
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
