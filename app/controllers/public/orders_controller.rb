class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @destinations = current_customer.destinations.all
  end

  def index
  end



  def show
  end

  def confirm
      @order = Order.new(order_params)

   if params[:order][:address_option] == "0" # [:address_option]=="0"を呼び出す
      @order.shi_postcord = current_customer.postcord
      @order.ship_address = current_customer.address
      @order.ship_name = current_customer.last_name + current_customer.first_name

   elsif params[:order][:address_option] == "1" # [:address_option]=="1"を呼び出す
      ship = Address.find(params[:order][:customer_id])
      @order.ship_postcord = ship.postcord
      @order.ship_address = ship.address
      @order.ship_name = ship.name
  end

  def thanks
  end

   private

    def order_params
        params.require(:order).permit(:postage, :payment_method, :ship_name, :ship_address, :ship_postcord, :customer_id,:charge,:status)
    end
end
