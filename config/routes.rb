Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ***** 以下を追加 *****
  root "foods#index"
  resources :foods
  # ***** 以上を追加 *****
end
