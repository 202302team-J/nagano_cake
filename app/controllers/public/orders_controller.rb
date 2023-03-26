class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @addresses = current_customer.destinations
  end

  def index
    @orders = current_customer.orders.all
  end

  def confirm
    @order = Order.new(order_params)

   if params[:order][:address_option] == "0" # [:address_option]=="0"を呼び出す
      @order.ship_postcode = current_customer.postcode
      @order.ship_address = current_customer.address
      @order.ship_name = current_customer.family_name + current_customer.personal_name

   elsif params[:order][:address_option] == "1" # [:address_option]=="1"を呼び出す
      ship = Destination.find(params[:order][:customer_id])
      @order.ship_postcode = ship.postcode
      @order.ship_address = ship.address
      @order.ship_name = ship.name

     # 新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
   elsif params[:order][:address_option] = "2"
      @order.ship_postcode = params[:order][:ship_postcode]
      @order.ship_address = params[:order][:ship_address]
      @order.ship_name = params[:order][:ship_name]

   else
      @order = Order.new(order_params)
      render 'new'
   end

      @cart_items = current_customer.cart_items.all
      @total = 0
      @cart_items.each do |cart_item|
      @total = @total+cart_item.subtotal
    end
      @order.customer_id = current_customer.id
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id


     if @order.customer.cart_items.count >= 1
        @order.save
        current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.item_count = cart_item.count
        @order_detail.tax_price = (cart_item.item.add_tax_price).round
        @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
        @order_detail.making_status = 0
        @order_detail.save
     end

      current_customer.cart_items.destroy_all #カートの中身を削除
      redirect_to thanks_orders_path
      else
       render "new"
     end
  end

  def thanks
  end

   private

    def order_params

         params.require(:order).permit(:postage, :payment_method, :ship_name, :ship_address, :ship_postcode, :customer_id,:charge,:status)

    end
end
