class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @addresses = current_customer.destinations
  end

  def index
  end



  def show
  end

  def confirm
      @order = Order.new(order_params)

   if params[:order][:address_option] == "0" # [:address_option]=="0"を呼び出す
      @order.shi_postcode = current_customer.postcode
      @order.ship_address = current_customer.address
      @order.ship_name = current_customer.last_name + current_customer.first_name

   elsif params[:order][:address_option] == "1" # [:address_option]=="1"を呼び出す
      ship = Address.find(params[:order][:customer_id])
      @order.ship_postcode = ship.postcode
      @order.ship_address = ship.address
      @order.ship_name = ship.name

    　# 新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
   elsif params[:order][:address_option] = "2"
      @order.ship_postcode = params[:order][:ship_postcode]
      @order.ship_address = params[:order][:ship_address]
      @order.ship_name = params[:order][:ship_name]
   else
      render 'new'
   end
  end

  def thanks
  end

   private

    def order_params

         params.require(:order).permit(:postage, :payment_method, :ship_name, :ship_address, :ship_postcode, :customer_id,:charge,:status)
    end
end
