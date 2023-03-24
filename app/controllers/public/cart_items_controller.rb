class Public::CartItemsController < ApplicationController


  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def create
    # where・・1つ以上持ってこれる
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_item = CartItem.new(cart_item_params)

  # find_by・・findとは違って、id以外のデータを持ってこれる　「もしカート内に同じ商品があるなら足す、違うなら作る」という記述
    if CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: params[:cart_item][:customer_id]).present?
     cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: params[:cart_item][:customer_id])
     cart_item.count += params[:cart_item][:count].to_i
     cart_item.update_attribute(:count,cart_item.count)
    else
     cart_item = CartItem.new(cart_item_params)
     cart_item.save
    end
     redirect_to  cart_items_path
  end


  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: "商品の追加に成功しました。"
    else
    render "index"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
    redirect_to cart_items_path
    else
    render "index"
    end
  end

  def destroy_all
    if current_customer.cart_items.destroy_all
    redirect_to cart_items_path
    else
    render "index"
    end
  end


private


  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :count)
  end


end