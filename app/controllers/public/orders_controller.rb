class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!

  def new
    @order = Order.new
    @orders = current_customer.orders.all
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses
  end

  def index
  end



  def show
  end

  def confirm
  end

  def thanks
  end

   private

  def order_params
    params.require(:order).permit(:payment_method, :name, :postcord, :address)
  end
end
