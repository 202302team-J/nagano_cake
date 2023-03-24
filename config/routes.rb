Rails.application.routes.draw do

# 管理側
  namespace :admin do
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    root 'homes#top'
  end

# 顧客側
 scope module: :public do
   root to: 'homes#top'
   get '/about' => 'homes#about'
   resources :items, only: [:index, :show]
   resources :destinations, only: [:index, :edit, :create, :update, :destroy]
   resources :cart_items, only: [:index, :update, :create, :destroy] do
     collection do #collectionはresourcesの中だとしてもidをpathから取り除ける
     delete 'destroy_all' => 'cart_items#destroy_all'
     end
   end
   resource :customers,only: [] do #resourceはidとindexをpathから取り除ける
     get 'my_page' => 'customers#show'
     get 'information/edit' => 'customers#edit'
     patch 'information' => 'customers#update'
     get 'unsubscribe' =>'customers#unsubscribe'
     patch 'withdraw' => 'customers#withdraw'
   end
   resources :orders,only: [:index, :new, :show, :create] do
     collection do
     post 'payment_method' => 'orders#payment_method' #これなんだっけ（テーブル定義書にはない）
     post 'confirm' => 'orders#confirm'
     get 'thanks' => 'orders#thanks'
     end
   end
 end


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
