Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:new, :create, :index, :show, :edit]
    root 'homes#top'
  end

 namespace :public do
   get 'customers/show'
   get 'customers/my_page' => 'customers#show', as: 'my_page'
   get 'customers/information/edit' => 'customers#edit'
   patch 'customers/information/edit' => 'customers#update', as: 'edit_my_page'
   get 'customers/unsubscribe' =>'customers#unsubscribe', as: 'unsubscribe_my_page'
   patch 'customers/is_deleted' => 'customers#is_deleted'
 end

  namespace :public do
    get 'destinations/index'
    get 'destinations/edit'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end

  namespace :public do
    post "orders/payment_method" => "orders#payment_method"
    get 'orders/confirm'
    get 'orders/thanks'
    resources :orders, only: [:new, :show, :create, :index]
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'homes/about'
    get 'homes/top'
  end
  namespace :public do
    get 'items/public/homes'
  end
  # namespace :public do
  #   get '/customers/my_page' => 'customers#show', as: 'my_page'
  #   get '/customers/information/edit' => 'customers#edit', as: 'edit_my_page'
  #   get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_my_page'
  # end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
