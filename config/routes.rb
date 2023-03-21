Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end

 namespace :public do
   get 'customers/show'
   get 'customers/infomation/edit'
   get 'customers/unsubscribe'
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
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
