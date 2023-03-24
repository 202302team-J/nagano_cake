class Public::HomesController < ApplicationController
  
  def top
    @items = Item.order('id DESC').limit(4)
    @genres = Genre.all
  end
  #ABCで古い順、DESCで新しい順、limitはとってくる限界を決めることができる
  
  def about
  end
  
end
