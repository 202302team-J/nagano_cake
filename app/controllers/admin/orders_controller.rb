class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.order_details.each do |detail|
      @total = @total+detail.subtotal
    end
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    # 注文ステータスが入金確認になると製作ステータスが全て製作中に変わる
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    end

    redirect_to admin_order_path(@order)
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end
end
