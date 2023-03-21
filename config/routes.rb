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
    resources :items, only: [:new, :create, :index, :show, :edit]
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
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/confirm'
    get 'orders/thanks'
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
  namespace :public do
    get 'customers/show'
    get 'customers/infomation/edit'
    get 'customers/unsubscribe'
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
