class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_detail][:order_id])
    # binding.pry
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      # 製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
      @order.update(status: 2) if @order_detail.making_status == "in_production"
      # 紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新させたい
      @order_details.each do |order_detail| #　紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。
      if order_detail.making_status != "completion_production" # 製作ステータスが「製作完了」ではない場合
        is_updated = false # 上記で定義してあるis_updatedを「false」に変更する。
      end
    end
    @order.update(status: 3) if is_updated
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
    redirect_to request.referer
    end
  end

  private
  def order_detail_params
      params.require(:order_detail).permit(:making_status)
  end
end
