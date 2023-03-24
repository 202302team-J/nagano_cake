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



  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    
  end


  def confirm
    @order = Order.new(order_params)
    @total = 0
    @order.order_details.each do |detail|
    @total = @total+detail.subtotal
  end
  
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
      render 'new'
   end

      @cart_items = current_customer.cart_items.all
      @order.customer_id = current_customer.id
  end

  def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id

      if @order.save
      current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
       @ordered_item = OrderedItem.new (order_id :@order.id)#初期化宣言
       ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
       ordered_item.item_count = cart_item.item_count #商品の個数を注文商品の個数に代入
       ordered_item.tax_price = (cart_item.price*1.10).floor #消費税込みに計算して代入
       ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
       ordered_item.status = 0
       ordered_item.save
     end

      current_customer.cart_items.destroy_all #カートの中身を削除
      redirect_to public_orders_thanks_path
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
