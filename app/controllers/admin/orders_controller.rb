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
    @order.update(order_params)
    redirect_to admin_customers_path(@order.customer)
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end
end
