Rails.application.routes.draw do
  root "home#index"
  get "home/index"

  devise_for :users

  # Carebit 選択ページ
  get "carebit/select", to: "carebits#select"
  post "carebit/choose", to: "carebits#choose"

  # マイページ
  get "mypage", to: "mypages#show"

  # Carebitログ完了アクション
  resources :user_carebit_logs, only: [] do
    member do
      patch :complete
    end
  end

  # Carebitログ詳細取得
  resources :user_carebit_logs, only: [ :show ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
