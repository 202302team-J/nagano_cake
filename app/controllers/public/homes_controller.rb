class Public::HomesController < ApplicationController

  def top
<<<<<<< HEAD
    @genres = Genre.all
    @items = Item.page(params[:page]).per(4)
  end

=======
    @items = Item.order('id DESC').limit(4)
    @genres = Genre.all
  end
  #ABCで古い順、DESCで新しい順、limitはとってくる限界を決めることができる
  
>>>>>>> origin/develop
  def about
  end

end
