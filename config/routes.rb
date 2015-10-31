Rails.application.routes.draw do


  get 'tickets/buy'

  resources :bowlers
  get 'bowlers/new'

  root 'home#index'



  resources :leagues


  resources :leagues do
    member do
      get 'add'
    end
  end

  resources :tickets do
    member do
      get 'buy'
    end
  end

  resources :leagues do
    member do
      get 'draw'
    end
  end

  post "tickets/:id/buy" => "tickets#buy"
  post "leagues/:id/add" => "leagues#add"
  post "leagues/:id/draw" => "leagues#draw"

  devise_for :users, controllers: { registrations: "registrations" }
 
end
