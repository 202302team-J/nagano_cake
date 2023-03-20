class Admin::HomesController < ApplicationController
  def top
    #1ページ分の決められた数のデータだけを、新しい順に取得する
    @orders = Order.page(params[:page])
  end
end
