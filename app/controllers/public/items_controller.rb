class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items_all = Item.all
    @items = Item.page(params[:page]).per(8)
    if params[:genre_id].present?
      #presentでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    end
    
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end




  def search
    @genres = Genre.all
  end

end